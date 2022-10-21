local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "typescript",
    "c",
    "cpp",
    "go",
    "rust",
    "php",
    "python",
    "yaml",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",

    -- cpp
    "clangd",
    -- csharp
    "omnisharp",
    --GO
    "gopls",
    "delve",
    --RUST,
    "rust-analyzer",
    --powershell
    "powershell-editor-services",
    --Python
    "python-language-server",
    "debugpy",
    --YAML
    "yaml-language-server",
    --Ansible
    "ansible-language-server",
    --Docker LS
    "docker-language-server",
    -- Bash LS
    "bash-language-server",
    -- Arduino LS
    "arduino-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
