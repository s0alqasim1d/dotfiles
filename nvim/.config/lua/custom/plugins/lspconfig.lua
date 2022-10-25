-- local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local navic = require "nvim-navic"
local configs = require "lspconfig.configs"
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

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
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      }
    },
  },
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
  sumneko_lua = {
    settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
  }
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
