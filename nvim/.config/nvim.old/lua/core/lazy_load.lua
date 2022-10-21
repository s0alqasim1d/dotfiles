local M = {}
local autocmd = vim.api.nvim_create_autocmd

-- require("packer").loader(tbl.plugins)
-- this must be used for plugins that need to be loaded just after a file
-- ex: tree-sitter, lspconfig, etc..
M.lazy_load = function (table)
	autocmd(table.events, {
		group = vim.api.nvim_create_augroup(table.augroup_name, {}),
		callback = function ()
			if table.condition() then
				vim.api.nvim_del_augroup_by_name(table.augroup_name)

				--NOTE: don't defer to treesitter as it will show slow highlighting
				--NOTE: this deferring only happens when we do 'nvim filename'
				if table.plugin ~= "nvim-treesitter" then
					vim.defer_fn(function ()
						require("packer").loader(table.plugin)
						if table.plugin == "nvim-lspconfig" then
							vim.call("silent! do FileType")
						end
					end, 0)
				else
					require("packer").loader(table.plugin)
				end
			end
		end,
	})
end

--NOTE: Load certain plugins only when there is a file opened in the buffer
--NOTE: if "nvim filename" is executed -> load the plugin after nvim gui loads
--NOTE: This gives an instant preview of nvim with the file opened

M.on_file_opened = function (plugin_name)
	M.lazy_load {
		events = { "BufRead", "BufWinEnter", "BufNewFile" },
		augroup_name = "BeLazyOnFileOpen" .. plugin_name,
		plugin = plugin_name,
		condition = function ()
			local file = vim.fn.expand "%"
			return file ~= "NvimTree_1" and file ~= "[packer]" and file ~= ""
		end,
	}
end

M.packer_cmds = {
	"PackerSnapshot",
	"PackerSnapshotRollback",
	"PackerSnapshotDelete",
	"PackerInstall",
	"PackerUpdate",
	"PackerSync",
	"PackerClean",
	"PackerCompile",
	"PackerStatus",
	"PackerProfile",
	"PackerLoad",
}

M.treesitter_cmds = {
	"TSInstall",
	"TSBufEnable",
	"TSBufDisable",
	"TSEnable",
	"TSDisable",
	"TSModuleInfo",
}

M.mason_cmds = {
	"Mason",
	"MasonInstall",
	"MasonInstallAll",
	"MasonUninstall",
	"MasonUninstallAll",
	"MasonLog",
}

M.gitsigns = function ()
	local gitsigns_auto_group = "GitSignsLazyLoad"
	autocmd({"BufRead"}, {
		group = vim.api.nvim_create_augroup(gitsigns_auto_group, {clear = true}),
		callback = function ()
			vim.fn.system("git rev-parse" .. vim.fn.expand "%:p:h")
			if vim.v.shell_error == 0 then
				vim.api.nvim_del_augroup_by_name(gitsigns_auto_group)
				vim.schedule(function ()
					require("packer").loader "gitsigns.nvim"
				end)
			end
		end,
	})
end

return M
