local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local configs = require("lspconfig.configs")
local lspcontainers = require("lspcontainers")
local capabilities = require"plugins.autocompletion_capabilities"
-- Use a loop to conveniently call "setup" on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
	bashls = {},
	dockerls = {},
	omnisharp = {},
	gopls = {
        cmd_builder = function(runtime, root_dir, image, network)
			local user = "gopls:gopls" --NOTE: or 1000:1001
			local gopath = "/home/gopls/go"
			local workdir= "/workspace/"
			local cutils = require("plugins.cutils")
			local volumes = {
				v1 = "--volume="..cutils.Dos2UnixSafePath(root_dir).."/:"..workdir,
				v2 = "--volume="..cutils.Dos2UnixSafePath(require("os").getenv("GOPATH"))..":".."/go:z",-- NOTE: We want to mount our local gopath as ro
			}
			return {
				runtime,
				"container",
				"run",
				"--rm",
				"-i",
				"-e GOPATH=/go:"..gopath,--NOTE: We add the mounted local GOPATH to the GOPATH variable on container
				"--network="..network,
				"-w"..workdir,
				volumes.v1,
				volumes.v2,
				"--user="..user,
				image,
				"gopls"
			}
		end,
		image = "lspcontainers/gopls",
		-- network = "bridge",
		-- root_dir = util.root_pattern("go.work", "go.mod", ".git", vim.fn.getcwd()), --, ),
		-- root_dir = vim.fn.getcwd(),
		--ISSUE: What is on_new_config?
		default_config = {
			cmd = {"gopls"},
			filetypes = {"go", "gomod", "gotmpl"},
			root_dir = util.root_pattern("go.work", "go.mod", ".git"), --, vim.fn.getcwd()),
			-- root_dir = function(fname)
			-- 	  return util.root_pattern 'go.work'(fname) or util.root_pattern('go.mod', '.git')(fname)
			-- 	end,
			single_file_support = true,
		},
		settings = {
		  gopls = {
			verboseOutput = true,
			analyses = {
			  unusedparams = true,
			},
			staticcheck = true,
		  },
		},
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
					kubernetes = { "/*.k8s.yaml","/*.k8s.yml" },
				},
				schemaDownload = {  enable = true },
				validate = true,
			},
			redhat = { telemetry = { enabled = false } },
		}
	},
	-- Custom LSP
	nginx_ls = {
		image = "s0alqasim1d/nginx-ls",
		default_config = {
			cmd = "/venv/bin/nginx-language-server -vv",
			filetypes = { "nginx" },
			root_dir = util.root_pattern("nginx.conf", ".git", vim.fn.getcwd()),
		}
	},
}

-- vim.pretty_print(lspcontainers.supported_languages.gopls)
for lsp, lsp_opts in pairs(servers) do
	-- print(lsp)
	-- print(lsp, lsp_opts.leave2lspconfig and 1 or 2)
	-- print(lsp, lsp_opts.default_config and 1 or 2)
	-- if not lspcontainers.supported_languages[lsp] then
	-- 	-- print(lsp .. " has config issue")
	-- 	configs[lsp] = { default_config = lsp_opts.default_config}
	-- 	lspcontainers.supported_languages[lsp] = lsp_opts.cmd
	-- end
	lspconfig[lsp].setup {
		before_init = function(params)
			params.processId = vim.NIL
		end,
		cmd = lspcontainers.command(lsp, lsp_opts),
		root_dir = lsp_opts.default_config and lsp_opts.default_config.root_dir or configs[lsp].default_config or util.root_pattern(".git", vim.fn.getcwd()),
		on_attach = on_attach,
		flags = {},
		capabilities = capabilities,
		settings = lsp_opts.settings or {}
	}
end

require"plugins/cmp"
