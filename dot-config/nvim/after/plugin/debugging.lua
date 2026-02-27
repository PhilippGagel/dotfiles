local dap = require('dap')

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-dap-19', -- adjust as needed, must be absolute path
    name = 'lldb'
}

local cppDebugDir = '/build/';
local rustDebugDir = '/target/debug/';

local defaultCPPConfig =
{
    name = 'General C++',
    type = 'lldb',
    request = 'launch',
    program = vim.fn.getcwd() .. cppDebugDir,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    console = "integratedTerminal",
    runInTerminal = true,
}

local defaultRustConfig =
{
    name = 'General Rust',
    type = 'lldb',
    request = 'launch',
    program = vim.fn.getcwd() .. rustDebugDir,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    console = "integratedTerminal",
    runInTerminal = true,
}

local function contains(dir, needle)
    local popen = io.popen
    local pfile = popen('ls -a "' .. dir .. '"')
    for filename in pfile:lines() do
        if filename == needle then
            return true
        end
    end
    return false
end

--- Check if a file or directory exists in this path
local function exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end

--- Check if a directory exists in this path
local function isdir(path)
    -- "/" works on both Unix and Windows
    return exists(path .. "/")
end

vim.keymap.set('n', '<F4>', function()
    local projectFolder = vim.fn.getcwd()
    local execPath = ""
    local config = {}
    if contains(projectFolder, "CMakeLists.txt") then
        if isdir(projectFolder .. "/" .. cppDebugDir) then
            execPath = projectFolder .. "/" .. cppDebugDir
            config = defaultCPPConfig
        end
    elseif contains(projectFolder, "Cargo.toml") then
        if isdir(projectFolder .. "/" .. rustDebugDir) then
            execPath = projectFolder .. "/" .. rustDebugDir
            config = defaultRustConfig
        end
    end
    execPath = execPath .. "/" .. vim.fn.input("Executable Name: > ")

    config.program = execPath

    require('dap').run(config)
end)
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F9>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<leader>lp',
    function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)
vim.keymap.set('n', '<leader>dc', function() require('dap').terminate() end)
vim.keymap.set('n', '<leader>dt', function() require('dapui').toggle() end)
vim.keymap.set('n', '<leader>dk', function() require('dapui').eval() end)

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
