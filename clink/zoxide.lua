-- =============================================================================
-- zoxide support for clink (cmd)
-- =============================================================================

settings.add('zoxide.cmd', 'z', 'Changes the prefix of the aliases')
settings.add('zoxide.hook', { 'pwd', 'prompt', 'none' }, 'Changes when directory scores are incremented')
settings.add('zoxide.no_aliases', false, "Don't define aliases")

local function __zoxide_cd(dir)
    if os.getenv('_ZO_ECHO') == '1' then
        print(dir)
    end
    -- Added a leading space so CMD ignores your `doskey cd=...` macro to prevent loops
    return ' cd /d "' .. dir .. '"'
end

local function __zoxide_query(options, keywords)
    local cmd_options = table.concat(options, ' ')
    local cmd_keywords = table.concat(keywords, ' ')

    local file = io.popen('zoxide query ' .. cmd_options .. ' -- ' .. cmd_keywords)
    if not file then return 'call' end
    
    local result = file:read('*line')
    local ok = file:close()

    if ok and result then
        return __zoxide_cd(result)
    else
        return 'call' -- no-op that just sets %ERRORLEVEL% to 1
    end
end

local function __zoxide_add(dir)
    os.execute('zoxide add -- "' .. dir .. '"')
end

local __zoxide_oldpwd
local __zoxide_prompt = clink.promptfilter()

function __zoxide_prompt:filter()
    local zoxide_hook = settings.get('zoxide.hook')
    if zoxide_hook == 'none' then
        return
    elseif zoxide_hook == 'prompt' then
        __zoxide_add(os.getcwd())
    elseif zoxide_hook == 'pwd' then
        local cwd = os.getcwd()
        if __zoxide_oldpwd and __zoxide_oldpwd ~= cwd then
            __zoxide_add(cwd)
        end
        __zoxide_oldpwd = cwd
    end
end

local function __zoxide_z(keywords)
    if #keywords == 0 then
        return __zoxide_cd(os.getenv('USERPROFILE'))
    elseif #keywords == 1 then
        local keyword = keywords[1]
        if keyword == '-' then
            return __zoxide_cd('-')
        elseif os.isdir(keyword) then
            return __zoxide_cd(keyword)
        end
    end

    local cwd = '"' .. os.getcwd() .. '"'
    return __zoxide_query({ '--exclude', cwd }, keywords)
end

local function __zoxide_zi(keywords)
    return __zoxide_query({ '--interactive' }, keywords)
end

local function onfilterinput(text)
    local args = string.explode(text, ' ', '"')
    if #args == 0 then return end

    local zoxide_cmd = settings.get('zoxide.cmd')
    local zoxide_no_aliases = settings.get('zoxide.no_aliases')

    local cmd = table.remove(args, 1)
    if cmd == '__zoxide_z' or (cmd == zoxide_cmd and not zoxide_no_aliases) then
        return __zoxide_z(args), false
    elseif cmd == '__zoxide_zi' or (cmd == zoxide_cmd .. 'i' and not zoxide_no_aliases) then
        return __zoxide_zi(args), false
    end
end

if clink.onfilterinput then
    clink.onfilterinput(onfilterinput)
else
    clink.onendedit(onfilterinput)
end
