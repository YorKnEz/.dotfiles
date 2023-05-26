local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

local dap_vt_status_ok, dap_vt = pcall(require, "nvim-dap-virtual-text")
if not dap_vt_status_ok then
  return
end

dap_vt.setup({})
dapui.setup({})

--[[ dapui.setup { ]]
--[[   sidebar = { ]]
--[[     elements = { ]]
--[[       { ]]
--[[         id = "scopes", ]]
--[[         size = 0.25, -- Can be float or integer > 1 ]]
--[[       }, ]]
--[[       { id = "breakpoints", size = 0.25 }, ]]
--[[     }, ]]
--[[     size = 40, ]]
--[[     position = "right", -- Can be "left", "right", "top", "bottom" ]]
--[[   }, ]]
--[[   tray = { ]]
--[[     elements = {}, ]]
--[[   }, ]]
--[[ } ]]

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/home/yorknez/Apps/vs-code-extensions/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description =  'enable pretty printing',
        ignoreFailures = false
      },
    },
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description =  'enable pretty printing',
        ignoreFailures = false
      },
    },
  },
}
