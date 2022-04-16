local lspconfig = require("lspconfig")
local lspcontainers = require("lspcontainers")
local capabilities = require"plugins/autocompletion_capabilities"
-- Use a loop to conveniently call "setup" on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
	"bashls",
	"dockerls",
	-- "gopls", has problem with env.HOME not being found
	"html",
	"jsonls",
	"powershell_es",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"tsserver",
	"yamlls"
}
local lsp_settings = {
	["sumneko_lua"] = {
		Lua = {
			diagnostics = {
				globals = {"vim", "use", "on_attach"},
			},
        },
	},
	["yamlls"] = {
		yaml = {
			yamlVersion = '1.2',
			trace = {
				server = "verbose"
			},
			schemas = {
--				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/all.json"] = "/*.k8s.yaml",
				["kubernetes"] = "/*.k8s.yaml",
--				["C:\\Users\\AlQasim\\Documents\\yamlls-schemas\\kubernetes-json-schema\\master-local\\all.json"] = "/*.k8s.yaml",
			},
			schemaDownload = {  enable = true },
			validate = true,
		},
		redhat = {
			telemetry = {
				enabled = false
			}
		}
	}
}

for _, lsp in pairs(servers) do
	-- print(lsp)
	lspconfig[lsp].setup {
		before_init = function(params)
			params.processId = vim.NIL
		end,
		cmd = lspcontainers.command(lsp),
		root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
		on_attach = on_attach,
		flags = {},
		capabilities = capabilities,
		settings = lsp_settings[lsp] or nil
	}
end

require"plugins/cmp"
