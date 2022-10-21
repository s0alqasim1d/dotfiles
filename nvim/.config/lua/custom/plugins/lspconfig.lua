local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local configs = require("lspconfig.configs")

local servers = {
  arduino_language_server = {
    cmd = {
      "arduino-language-server",
      "-cli-config", "/Users/AlQasim/AppData/Local/Arduino15/arduino-cli.yaml",
      -- "-fqbn", "arduino:avr:uno",
      "-cli", "arduino-cli",
      "-clangd", "clangd"
    }
  },
  html = {},
  cssls = {},
  tsserver = {},
  clangd = {},
  gopls = {
    settings = {
		  gopls = {
			analyses = {
			  unusedparams = true,
			},
			staticcheck = true,
		  },
		},
  },
  rust_analyzer = {
    settings = {
			rust_analyzer = {
				imports = {
					granularity = {
						group = "module",
					},
					prefix = "self",
				},
				-- trace = {
				-- 	server = "verbose",
				-- },
				cargo = {
					buildScripts = {
						enable = true,
					},
					proMacro = {
						enable = true,
					},
				}
			}
		}
  },
  pylsp = {},
  powershell_es = {},
  yamlls = {
    settings = {
      yaml = {
				yamlVersion = "1.2",
				trace = { server = "verbose" },
				schemas = {
					kubernetes = { "/*.k8s.yaml","/*.k8s.yml" },
				},
				schemaDownload = {  enable = true },
				validate = true,
			},
			redhat = { telemetry = { enabled = false } },
		}
  },
}

-- print("Configuring LSPs")
for lsp, lsp_opts in pairs(servers) do
  -- print("Configuring "..lsp)
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = lsp_opts.settings or nil,
    cmd = configs.lsp or lsp_opts.cmd or nil,
  }
end
