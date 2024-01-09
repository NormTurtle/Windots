-- ************ KEYMAPS *******************
local map = vim.keymap.set

local function pcall_decorate(func)
    return function(...)
        local status, ret = pcall(func, ...)
        if not status then
            vim.api.nvim_err_writeln(ret)
        end
        return ret
    end
end

map("n", "<leader>cd", "<cmd>cd %:p:h<cr><cmd>pwd<cr>", { desc = "CD to current buffer", silent = true })
map("i", "<C-l>", "<c-g>u<Esc>[sz=`]a<c-g>u", { desc = "Correct last spelling error", silent = true })

-- ******************** TAB LINE ******************
local function get_icon(buf)
    local devicons_present, devicons = pcall(require, "nvim-web-devicons")
    if devicons_present then
        local name = vim.api.nvim_buf_get_name(buf)
        local icon = devicons.get_icon(name, vim.fn.fnamemodify(name, ":e"), { default = true })
        return icon .. " "
    end
    return ""
end

local function get_buf_name(buf)
    local modified = vim.api.nvim_get_option_value("modified", { buf = buf })
    local buf_type = vim.api.nvim_get_option_value("buftype", { buf = buf })
    local file_type = vim.api.nvim_get_option_value("filetype", { buf = buf })
    local name = vim.api.nvim_buf_get_name(buf)

    if buf_type == "terminal" then
        name = string.format("[%s: %d]", vim.fn.fnamemodify(name, ":t:r"), buf)
    elseif buf_type == "quickfix" then
        name = string.format("[quickfix: %d]", buf)
    elseif string.match(name, "://") then
        name = name
    elseif buf_type == "acwrite" or buf_type == "nofile" then
        name = string.format("[scratch: %d]", buf)
    else
        name = vim.fn.fnamemodify(name, ":t")
        if name == "" then
            name = string.format("[%s: %d]", file_type == "" and "new" or file_type, buf)
        end
        local modified_display = modified and "● " or ""
        name = modified_display .. get_icon(buf) .. name
    end
    return name
end

local function count_terminal_buffers()
    return #vim.tbl_filter(function(buf)
        return vim.bo[buf].buftype == "terminal"
    end, vim.api.nvim_list_bufs())
end

function TablineSwitchBuffer(handle, _, _, _)
    vim.api.nvim_set_current_buf(handle)
end

function TablineDeleteBuffer(handle, _, _, _)
    vim.api.nvim_buf_delete(handle, {})
    vim.cmd.redrawtabline()
end

function TablineSwitchTabpage(handle, _, _, _)
    vim.api.nvim_set_current_tabpage(handle)
end

function Tabline()
    local active_hl = "%#TabLineSel#"
    local inactive_hl = "%#TabLine#"
    local fill_hl = "%#TabLineFill#"

    local ignored_ft = { "fugitive" }
    local buffers = vim.tbl_filter(function(buf)
        return vim.api.nvim_get_option_value("buflisted", { buf = buf })
            and not vim.list_contains(ignored_ft, vim.bo[buf].filetype)
    end, vim.api.nvim_list_bufs())

    local buffers_reprs = {}
    for _, handle in ipairs(buffers) do
        local hl = handle == vim.api.nvim_get_current_buf() and active_hl or inactive_hl
        local name = get_buf_name(handle)
        local switch_func = string.format("%%%d@v:lua.TablineSwitchBuffer@", handle)
        local close_func = string.format("%%%d@v:lua.TablineDeleteBuffer@", handle)
        local repr = string.format("%s %s %%X%s ✕ %%X", switch_func, name, close_func)
        table.insert(buffers_reprs, hl .. repr)
    end

    local tabpage_reprs = {}
    local current_tabpage = vim.api.nvim_get_current_tabpage()
    for tabpage_num, handle in ipairs(vim.api.nvim_list_tabpages()) do
        local hl = handle == current_tabpage and active_hl or inactive_hl
        local click_func = string.format("%%%d@v:lua.TablineSwitchTabpage@", handle)
        local repr = string.format("%s %d %%X", click_func, tabpage_num)
        table.insert(tabpage_reprs, hl .. repr)
    end

    local terminal_count_repr = string.format("%s  %d %s", active_hl, count_terminal_buffers(), inactive_hl)
    return table.concat({
        table.concat(buffers_reprs),
        fill_hl,
        "%=",
        terminal_count_repr,
        vim.fn.tabpagenr("$") == 1 and "" or table.concat(tabpage_reprs),
    })
end
vim.opt.tabline = "%!v:lua.Tabline()"
vim.opt.showtabline = 2 -- Always show tabline

-- *********** MINIMAL TOGGLE TERM IMPLEMENTATION ***********
local function get_terminal_buffers()
    return vim.tbl_filter(function(buf)
        return vim.bo[buf].buftype == "terminal"
    end, vim.api.nvim_list_bufs())
end

local function create_terminal_buffer()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_option_value("filetype", "terminal", { buf = buf })
    return buf
end

local function get_terminal_windows()
    local current_tabpage = vim.api.nvim_get_current_tabpage()
    local windows = vim.tbl_filter(function(win)
        local buf = vim.api.nvim_win_get_buf(win)
        return vim.api.nvim_win_get_tabpage(win) == current_tabpage and vim.bo[buf].buftype == "terminal"
    end, vim.api.nvim_list_wins())
    return windows
end

local function create_terminal_window()
    local current_win = vim.api.nvim_get_current_win()
    vim.cmd("botright split")
    local terminal_win = vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(current_win)
    return terminal_win
end

local function create_or_open_terminal(buffers)
    local windows = get_terminal_windows()
    local win = next(windows) == nil and create_terminal_window() or windows[1]
    local buf = next(buffers) == nil and create_terminal_buffer() or buffers[1]
    vim.api.nvim_win_set_buf(win, buf)
    vim.api.nvim_set_current_win(win)
    if next(buffers) == nil then
        vim.fn.termopen(vim.o.shell)
    end
end

local function get_next_terminal_buffer(window, direction)
    local current_buf = vim.api.nvim_win_get_buf(window)
    local buffers = get_terminal_buffers()
    local idx = 0
    for i, buf in ipairs(buffers) do
        if buf == current_buf then
            idx = i
        end
    end
    return buffers[((idx - 1 + direction) % #buffers) + 1]
end

local function toggle_terminal()
    if vim.list_contains(get_terminal_windows(), vim.api.nvim_get_current_win()) then
        vim.cmd.close()
    else
        create_or_open_terminal(get_terminal_buffers())
    end
end

local function new_terminal()
    create_or_open_terminal({})
end

local function switch_terminal_buffers(direction)
    local windows = get_terminal_windows()
    if vim.list_contains(windows, vim.api.nvim_get_current_win()) then
        local buf = get_next_terminal_buffer(vim.api.nvim_get_current_win(), direction)
        vim.api.nvim_win_set_buf(0, buf)
    else
        toggle_terminal()
    end
end

local function bnext_terminal_aware()
    if vim.bo.buftype == "terminal" then
        switch_terminal_buffers(1)
    else
        vim.cmd.bnext()
    end
end

local function bprevious_terminal_aware()
    if vim.bo.buftype == "terminal" then
        switch_terminal_buffers(-1)
    else
        vim.cmd.bprevious()
    end
end

local map = vim.keymap.set
local modes = { "n", "t" }
map(modes, "<C-`>", toggle_terminal, { desc = "Toggle terminal", silent = true })
map(modes, "<A-`>", new_terminal, { desc = "Create and switch to new terminal", silent = true })
map(modes, "<A-l>", bnext_terminal_aware, { desc = "Switch to next buffer (terminal aware)", silent = true })
map(modes, "<A-k>", bnext_terminal_aware, { desc = "Switch to next buffer (terminal aware)", silent = true })
map(modes, "<A-h>", bprevious_terminal_aware, { desc = "Switch to previous buffer (terminal aware)", silent = true })
map(modes, "<A-j>", bprevious_terminal_aware, { desc = "Switch to next buffer (terminal aware)", silent = true })
vim.api.nvim_create_user_command("Terminal", toggle_terminal, { desc = "Toggle terminal window" })
vim.api.nvim_create_user_command("TerminalNew", new_terminal, { desc = "Create a new terminal buffer" })

-- ******************** ALIGN ******************
local function split(line, pattern)
    if #pattern == 0 or #line == 0 then
        return { line }
    end
    local sections = {}
    local index = 1
    while index <= #line do
        local start_idx, end_idx = string.find(line, pattern, index)
        if start_idx ~= nil and end_idx >= start_idx then
            table.insert(sections, string.sub(line, index, start_idx - 1))
            table.insert(sections, string.sub(line, start_idx, end_idx))
            index = end_idx + 1
        else
            table.insert(sections, string.sub(line, index, #line))
            index = #line + 1
        end
    end
    return sections
end

local function compute_max_section_widths(splits)
    local max_split_length = 0
    for _, parts in ipairs(splits) do
        max_split_length = math.max(max_split_length, #parts)
    end

    local max_section_widths = {}
    for i = 1, max_split_length do
        max_section_widths[i] = 0
    end

    for _, parts in ipairs(splits) do
        if #parts ~= 1 then
            for i, part in ipairs(parts) do
                max_section_widths[i] = math.max(max_section_widths[i], #part)
            end
        end
    end
    return max_section_widths
end

local function align_line_right(parts, max_section_widths)
    for i, part in ipairs(parts) do
        -- last part doesn't need to be padded if empty string
        if #part ~= 0 or #parts ~= i then
            parts[i] = string.rep(" ", max_section_widths[i] - #part) .. part
        end
    end
    return parts
end

local function align_line_left(parts, max_section_widths)
    for i, part in ipairs(parts) do
        if i ~= #parts then -- last part doesn't need to be padded
            parts[i] = part .. string.rep(" ", max_section_widths[i] - #part)
        end
    end
    return parts
end

local function align_line_center(parts, max_section_widths)
    for i = 1, #parts do
        local left_pad = math.floor((max_section_widths[i] - #parts[i]) / 2)
        parts[i] = string.rep(" ", left_pad) .. parts[i]
        local right_pad = max_section_widths[i] - #parts[i]
        -- last part doesn't need to be padded on the right
        if i ~= #parts then
            parts[i] = parts[i] .. string.rep(" ", right_pad)
        end
    end
    return parts
end

local function align_all_lines(lines, pattern, align_fn)
    local splits = {}
    for _, line in ipairs(lines) do
        table.insert(splits, split(line, pattern))
    end
    local max_section_widths = compute_max_section_widths(splits)

    local new_lines = {}
    for _, parts in ipairs(splits) do
        local new_line = {}
        -- No need to align only one part
        local aligned = #parts == 1 and parts or align_fn(parts, max_section_widths)
        for _, part in ipairs(aligned) do
            table.insert(new_line, part)
        end
        table.insert(new_lines, table.concat(new_line))
    end
    return new_lines
end

local function align_all_selection(pattern, align_fn)
    local top, bot = vim.fn.getpos("'<"), vim.fn.getpos("'>")
    local startline = top[2] - 1
    local endline = bot[2]
    local lines = vim.api.nvim_buf_get_lines(0, startline, endline, false)
    lines = align_all_lines(lines, pattern, align_fn)
    vim.api.nvim_buf_set_lines(0, startline, endline, false, lines)
    vim.fn.setpos("'<", top)
    vim.fn.setpos("'>", bot)
end

local function create_preview_fn(align_fn)
    return function(opts, _, _)
        align_all_selection(opts.args, align_fn)
        return 1
    end
end

vim.api.nvim_create_user_command("Align", function(opts)
    align_all_selection(opts.args, align_line_left)
end, {
    range = true,
    nargs = "+",
    preview = create_preview_fn(align_line_left),
})

vim.api.nvim_create_user_command("AlignRight", function(opts)
    align_all_selection(opts.args, align_line_right)
end, {
    range = true,
    nargs = "+",
    preview = create_preview_fn(align_line_right),
})

vim.api.nvim_create_user_command("AlignCenter", function(opts)
    align_all_selection(opts.args, align_line_center)
end, {
    range = true,
    nargs = "+",
    preview = create_preview_fn(align_line_center),
})
