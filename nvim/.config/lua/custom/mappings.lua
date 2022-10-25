--WARN: n, v, i, t = mode names
--ERROR: A lot of mappings are commented out because they already exist, so it is a waste of time to override them
-- local function termcodes(str)
-- 	return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

--NOTE: This is the structure to be followed.
-- M.<whatever_is_the_module_name> = {
--  plugin = <true | false>, -- this doesn't apply to M.general
--
--  <n | v | i | t > = { mode to map keys for is the table name
--    --key mappings
--    ["<keystroke_to_map>"] = {
--      <"keystroke_to_invoke" | function implementation to invoke>,
--      "Description",
--      opts = {silent = true|false, etc...},
--    },
--  },
-- }
--NOTE: Remove default <leader>x binding for buffer closure
-- vim.keymap.del({'n'}, '<leader>x')

local M = {}

M.general = {
	n = { --NOTE: NORMAL Mode
    [";"] = { ":", "command mode", opts = { nowait = true } },
		--NOTE: Resize active window
		["<C-Up>"] = {":resize -2<CR>"},
		["<C-Down>"] = {":resize +2<CR>"},
		["<C-Right>"] = {":vert resize -2<CR>"},
		["<C-Left>"] = {":vert resize +2<CR>"},
		--NOTE: Center screen after seeking next search result or backtracking
		["n"] = {"nzzzv"},
		["N"] = {"Nzzzv"},
    ["x"] = {'"_x'},
	},
	v = { --NOTE: VISUAL MODE
		--NOTE: Allow moving the cursor through wrapped lines with j, k, <Up> & <Down>
		-- ["<Up>"] = {'v:count || mode(1)[0:1] == "no" ? "k": "gk"', opts = {expr = true} },
		-- ["<Down>"] = {'v:count || mode(1)[0:1] == "no" ? "j": "gj"', opts = {expr = true} },
		--NOTE: Indent inwards or outwards
      ["<"] = {"<gv", opts = {silent = true}},
      [">"] = {">gv", opts = {silent = true}},
      -- ['K'] = {'<cmd> m \'>-2<CR>gv-gv', opts = {noremap = true, silent = true}},
      -- ['J'] = {'<cmd> m \'>+1<CR>gv-gv', opts = {noremap = true, silent = true}},
	},
}

M.tabufline = {
  plugin = true,
  n = {
    -- close buffer + hide terminal buffer
    ["<C-x>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dh"] = {
      function ()
        require"dap".toggle_breakpoint()
      end,
      "Toggle breakpoint"
    },
    ["<leader>dH"] = {
      function ()
        require"dap".set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end,
      "Toggle conditional breakpoint"
    },
    ["<S-Down>"] = {
      function ()
        require"dap".step_into()
      end,
      "Step into"
    },
    ["<S-Up>"] = {
      function ()
        require"dap".step_out()
      end,
      "Step out"
    },
    ["<S-Right>"] = {
      function ()
        require"dap".step_over()
      end,
      "Step over"
    },
  },
}


M.trouble = {
  plugin = true,
  n = {
    ["<leader>xx"] = {"<cmd> TroubleToggle<CR>", "Toggle trouble", opts = {silent = true, noremap = true}},
    ["<leader>xw"] = {"<cmd> TroubleToggle workspace_diagnostics<CR>", "Toggle trouble workspace diagnostics", opts = {silent = true, noremap = true}},
    ["<leader>xd"] = {"<cmd> TroubleToggle document_diagnostics<CR>", "Toggle trouble document diagnostics", opts = {silent = true, noremap = true}},
    ["<leader>xl"] = {"<cmd> TroubleToggle loclist<CR>", "Toggle trouble location list", opts = {silent = true, noremap = true}},
    ["<leader>xq"] = {"<cmd> TroubleToggle quickfix<CR>", "Toggle trouble quickfix list", opts = {silent = true, noremap = true}},
    ["<leader>xr"] = {"<cmd> TroubleToggle lsp_references<CR>", "Toggle trouble lsp references", opts = {silent = true, noremap = true}},
  },
}
-- M.telescope = {
-- 	plugin = true,
--   i = {
--    ["<ESC>"] = { "<cmd>lua require('telescope.actions').close(vim.api.nvim_get_current_buf()) <CR>", "Close telescope buffer"},
--   },
-- }



return M
