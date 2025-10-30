return {
  -- Colorscheme
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },
  -- Enable hidden files in picker
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        ignored = true,
        finder = {
          ignore_patterns = {
            "node_modules",
            ".git",
          },
        },
        sources = {
          files = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
  -- Augment CLI
  -- {
  -- "augmentcode/augment.vim",
  -- },
  -- Mermaid Playground
  {
    "selimacerbas/mermaid-playground.nvim",
    dependencies = { "barrett-ruth/live-server.nvim" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "markdown",
      },
    },
  },
  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",
    config = true,
  },
  -- DBT Templater
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        sqlfluff = {
          stdin = false,
          args = { "fix", "$FILENAME" },
          timeout_ms = 10000,
        },
      },
    },
  },
}
