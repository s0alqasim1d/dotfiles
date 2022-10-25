local overrides = require "custom.plugins.overrides"
-- print("I'm running your overrides")
return {

  ["goolord/alpha-nvim"] = { disable = false }, -- enables dashboard
  ["folke/which-key.nvim"] = { disable = false }, -- enables whichkey

  ["SmiteshP/nvim-navic"] = {},

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    after = "nvim-navic",
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
    opt = true,
    after = "nvim-treesitter",
  },

  ["nvim-treesitter/playground"] = {
    opt = true,
    event = "BufRead",
    -- after = "nvim-treesitter-textobjects",
  },

  ["mfussenegger/nvim-dap"] = {
    opt = true,
    after = "playground",
    setup = function ()
      require("core.lazy_load").on_file_open "nvim-dap"
      require("core.utils").load_mappings "dap"
    end,
    config = function ()
      require "custom.plugins.dap"
    end
  },

  ["theHamsta/nvim-dap-virtual-text"] = {
    opt = true,
    after = "nvim-dap",
    config = function ()
      require("nvim-dap-virtual-text").setup()
    end
  },

  ["rcarriga/nvim-dap-ui"] = {
    opt = true,
    after = "nvim-dap-virtual-text",
    config = function()
      require "custom.plugins.dapui"
    end,
  },

  ["folke/todo-comments.nvim"] = {
    opt = true,
    -- event = "BufRead",
    after = "nvim-dap-ui",
    requires = {"plenary.nvim"},
    config = function ()
      require"todo-comments".setup()
    end
  },

  ["folke/trouble.nvim"] = {
    opt = true,
    -- after = "todo-comments.nvim",
    requires = {"nvim-web-devicons",},
    setup = function ()
      require "core.utils".load_mappings "trouble"
    end,
    config = function ()
      require"trouble".setup()
    end
  },
  -- to remove plugin assign false to it here, i.e.:
  -- ["example/plugin-to-disable"] = false,
  ["hrsh7th/cmp-calc"] = { after = "cmp-nvim-lsp" },
  ["hrsh7th/cmp-path"] = {
   override_options = overrides.cmp,
  },
}
