local line = require("lualine")
local gps = require("nvim-gps")
line.setup({
  options = {
    theme = "auto",
    disabled_filetypes = { "dashboard", "startify", "NvimTree", "packer" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      { "filename", path = 1 },
      { "diagnostics", sources = { "nvim_lsp" } },
	  { gps.get_location, cond = gps.is_available }
    },
    lualine_x = {
      require("lsp-status").status,
      "diff",
      "encoding",
      "fileformat",
    },
    lualine_y = { "filetype" },
    lualine_z = {
      { "progress", padding = { right = 0 }, separator = "" },
      { "location", padding = { left = 0 } },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
})
