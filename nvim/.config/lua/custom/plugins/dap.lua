local dap = require "dap"
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
local executables_folder = is_windows and "Scripts" or "bin"

local function get_arguments()
  local co = coroutine.running()
  if co then
    return coroutine.create(function()
      local args = {}
      vim.ui.input({ prompt = 'Args: ' }, function(input)
        args = vim.split(input or "", " ")
      end)
      coroutine.resume(co, args)
    end)
  else
    local args = {}
    vim.ui.input({ prompt = 'Args: ' }, function(input)
      args = vim.split(input or "", " ")
    end)
    return args
  end
end

local debuggables = {
  go = {
    -- alt_config_name = "go", --NOTE: Docs say adapter for go is at dap.adapters.delve while config at dap.configurations.go
    adapter = {
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = {"dap", "-l", "127.0.0.1:${port}"},
      }
    },
    configuration = {
      {
        type = "go",
        name = "Debug",
        request = "launch",
        program = "${file}",
      },
      {
        type = "go",
        name = "Debug (Arguments)",
        request = "launch",
        program = "${file}",
        args = get_arguments,
      },
      {
        type = "go",
        name = "Debug Package",
        request = "launch",
        program = "${fileDirname}",
      },
      {
        type = "go",
        name = "Attach",
        mode = "local",
        request = "attach",
        processId = require('dap.utils').pick_process,
      },
      {
        type = "go",
        name = "Debug test",
        request = "launch",
        mode = "test",
        program = "${file}",
      },
      {
        type = "go",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
      }
    },
  },
  python = {
    adapter = {
      type = 'executable',
      command = 'python',--os.getenv("HOME")..'/.virtualenvs/debugpy/'..executables_folder..'/python';
      args = { '-m', 'debugpy.adapter' },
    },
    configuration = {
      {
        type = "python",
        request = "launch",
        program = "${file}"; -- This configuration will launch the current file if used.
        pythonPath = function()
          -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
          -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
          -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
          local venv = os.getenv("VIRTUAL_ENV")
          local command = vim.fn.getcwd() .. string.format("%s/%s/python",venv, executables_folder)
          if vim.fn.executable(command) == 1 then
            return command
          else
            return 'python'
          end
        end
      },
    },
  },
}

for language, config in pairs(debuggables) do
  dap.adapters[language] = config.adapter
  -- if config.alt_config_name then
  --   print("alt config name is: ", config.alt_config_name)
  --   dap.configurations[config.alt_config_name] = config.configuration
  -- else
    dap.configurations[language] = config.configuration
  -- end
end
