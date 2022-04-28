local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local lspcontainers = require("lspcontainers")
local capabilities = require"plugins/autocompletion_capabilities"
-- Use a loop to conveniently call "setup" on multiple servers and
-- map buffer local keybindings when the language server attaches
local cutils = require("plugins.cutils")
-- print(cutils.Dos2UnixSafePath(vim.fn.getcwd())..":/workspace")
local servers = {
	bashls = {},
	dockerls = {},
	gopls = {
        cmd = function()
			local gopath = "/home/gopls/go"
			local image = "docker.io/lspcontainers/gopls"
			local user = "gopls"
			local volumes = {
				v1 = "--volume="..cutils.Dos2UnixSafePath(vim.fn.getcwd())..":/workspace",
				v2 = "--volume="..cutils.Dos2UnixSafePath(require("os").getenv("GOPATH"))..":"..gopath,
			}
			print(volumes.v1, volumes.v2)
			return {
			"docker",
			"container",
			"run",
			"--env",
			"GOPATH="..gopath,
			"--interactive",
			"--network=bridge",
			"--rm",
			"--workdir=/workspace",
			volumes.v1,
			volumes.v2,
			"--user="..user,
			image,
			"gopls serve"
			}
		end,
		default_config = {
			cmd = {"gopls", "serve"},
			filetypes = {"go", "gomod"},
			root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
		},
		settings = {
		  gopls = {
			analyses = {
			  unusedparams = true,
			},
			staticcheck = true,
		  },
		},
		image = "docker.io/lspcontainers/gopls",
		network="bridge",
		leave2lspconfig = false,
	},
	html = {},
	jsonls = {},
	powershell_es = {},
	pyright = {},
	rust_analyzer = {},
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = {"vim", "use", "on_attach"},
				},
        	},
		},
	},
	tsserver = {},
	yamlls = {
		settings = {
			yaml = {
				yamlVersion = "1.2",
				trace = { server = "verbose" },
				schemas = {
	--				https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/all.json = "/*.k8s.yaml",
					kubernetes = "/*.k8s.yaml",
				},
				schemaDownload = {  enable = true },
				validate = true,
			},
			redhat = { telemetry = { enabled = false } },
		}
	},
	-- Custom LSP
	nginx_ls = {
			leave2lspconfig = true,
			image = "s0alqasim1d/nginx-ls",
			default_config = {
				cmd = "/venv/bin/nginx-language-server -vv",
				filetypes = { "nginx" },
				root_dir = lspconfig.util.root_pattern("nginx.conf", ".git", vim.fn.getcwd()),
			}
	},
}

for lsp, lsp_opts in pairs(servers) do
	-- print(lsp)
	-- print(lsp_opts.leave2lspconfig and 1 or 2)
	if not lspcontainers.supported_languages[lsp] then
		-- print(lsp .. " has config issue")
		configs[lsp] = { default_config = lsp_opts.default_config}
	end
	lspconfig[lsp].setup {
		before_init = function(params)
			params.processId = vim.NIL
		end,
		cmd = lsp_opts.leave2lspconfig and lspcontainers.command(lsp, { image = lsp_opts.image }) or lspcontainers.command(lsp, lsp_opts),
		root_dir = lsp_opts.default_config ~= nil and lsp_opts.default_config.root_dir or lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
		on_attach = on_attach,
		flags = {},
		capabilities = capabilities,
		settings = lsp_opts.settings or {}
	}
end

require"plugins/cmp"
