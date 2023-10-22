vim.opt_local.foldmethod = "marker"
vim.opt_local.foldmarker = "#ifdef LOCAL,#endif"

vim.cmd.iabbrev({"<buffer>", "itn", "int"})
vim.cmd.iabbrev({"<buffer>", "icn", "cin"})
vim.cmd.iabbrev({"<buffer>", "cotu", "cout"})
vim.cmd.iabbrev({"<buffer>", "endl", "'\\n'"})
vim.cmd.iabbrev({"<buffer>", "vi", "vector<int>"})
vim.cmd.iabbrev({"<buffer>", "vpi", "vector<pair<int, int> >"})
vim.cmd.iabbrev({"<buffer>", "pii", "pair<int, int>"})
vim.cmd.iabbrev({"<buffer>", "yes", "cout << \"YES\\n\";"})
vim.cmd.iabbrev({"<buffer>", "no", "cout << \"NO\\n\";"})

vim.keymap.set('n', '<C-\'>', "<CMD> wa | TermExec cmd='runcpp %'<CR>", {buffer = true})

for i = 1, 5 do
    vim.keymap.set('n', '<leader>' .. i, string.format('<CMD> wa | cd ~/code | e %s.cpp | %%bd | e# | bd#<CR><CR>', string.char(64 + i)), {buffer = true})
end


vim.keymap.set('n', '<leader>i', function()
    if vim.fn.bufloaded(vim.fn.expand("~") .. "/code/Input") == 0 then
        vim.cmd[[vs ~/code/Input | set ft=cfg | vertical resize 50 | set winfixwidth | sp ~/code/Output | set ft=cfg | wincmd h]]
    else
        vim.cmd[[wa | bunload Input Output]]
    end

    print(" ")
end, {buffer = true})
