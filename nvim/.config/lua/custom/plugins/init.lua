local overrides = require "custom.plugins.overrides"

return {

  ["goolord/alpha-nvim"] = { disable = false }, -- enables dashboard
  ["folke/which-key.nvim"] = { disable = false, }, -- enables whichkey

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["nvim-treesitter/nvim-treesitter-textobjects"] = {
    after = "nvim-treesitter",
  },

  ["nvim-treesitter/playground"] = {
    after = "nvim-treesitter-textobjects",
    config = function ()
      require "nvim-treesitter.configs".setup {
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        }
      }
  end
  },
  ["mfussenegger/nvim-dap"] = {
    opt = true,
    -- module = { "nvim-dap", "dap" },
    cmd = {
      "DapContinue",
      "DapLoadLaunchJSON",
      "DapRestartFrame",
      "DapSetLogLevel",
      "DapShowLog",
      "DapStepInto",
      "DapStepOut",
      "DapStepOver",
      "DapTerminate",
      "DapToggleBreakpoint",
      "DapToggleRepl",
    },
    -- after = "nvim-treesitter",
    after = "playground",
    -- setup = function()
    --   require("core.lazy_load").on_file_open "nvim-dap"
    --   require("core.utils").load_mappings "dap"
    -- end,
    -- config = function ()
    --   require("dap").setup()
    -- end,
  },
  ["rcarriga/nvim-dap-ui"] = {
    opt = true,
    after = "nvim-dap",
    config = function()
      require "custom.plugins.dapui"
    end,
  },
  ["theHamsta/nvim-dap-virtual-text"] = {
    opt = true,
    after = "nvim-dap",
    config = function ()
      require("nvim-dap-virtual-text").setup()
    end
  },
  ["folke/trouble.nvim"] = {
    opt = true,
    module = "trouble",
    requires = {"nvim-web-devicons",},
    after = "nvim-dap-virtual-text",
    config = function ()
      require"trouble".setup()
    end
  },
  ["folke/todo-comments.nvim"] = {
    opt = true,
    requires = {"plenary"},
    after = "trouble",
    config = function ()
      require"todo-comments".setup()
    end
  }
  -- to remove plugin assign false to it here, i.e.:
  -- ["hrsh7th/cmp-path"] = false,
}
