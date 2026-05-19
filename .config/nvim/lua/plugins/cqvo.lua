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
  -- {
  --   "folke/snacks.nvim",
  --   opts = {
  --     picker = {
  --       hidden = true,
  --       ignored = true,
  --       finder = {
  --         ignore_patterns = {
  --           "**/node_modules/**",
  --           "**/.git/**",
  --           "**/*.log",
  --         },
  --       },
  --       sources = {
  --         files = {
  --           hidden = true,
  --           ignored = true,
  --         },
  --       },
  --     },
  --   },
  -- },
  -- Augment CLI
  {
    "augmentcode/augment.vim",
    init = function()
      vim.g.augment_workspace_folders = { "~/workspace/ssr-frontend" }
      vim.g.augment_disable_tab_mapping = true
    end,
    keys = {
      {
        "<C-y>",
        function()
          vim.cmd("call augment#Accept()")
        end,
        mode = "i",
        desc = "Accept suggestion (augment.nvim)",
      },
    },
  },
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
  {
    "chrisgrieser/nvim-rip-substitute",
    keys = {
      {
        "g/",
        function()
          require("nvim-rip-substitute").sub()
        end,
        mode = { "n", "x" },
        desc = "Rip Substitute",
      },
    },
  },
}
