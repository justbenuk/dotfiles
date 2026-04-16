return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.prisma" },
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  { import = "lazyvim.plugins.extras.editor.fzf" },
  { import = "lazyvim.plugins.extras.editor.inc-rename" },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "emmet-language-server",
        "eslint-lsp",
        "prettierd",
        "prisma-language-server",
        "tailwindcss-language-server",
        "typos",
        "vtsls",
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "css",
        "gitignore",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "markdown",
        "markdown_inline",
        "prisma",
        "regex",
        "scss",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      opts.servers.emmet_language_server = vim.tbl_deep_extend("force", opts.servers.emmet_language_server or {}, {
        filetypes = {
          "css",
          "eruby",
          "html",
          "javascriptreact",
          "less",
          "sass",
          "scss",
          "typescriptreact",
        },
      })

      opts.servers.tailwindcss = vim.tbl_deep_extend("force", opts.servers.tailwindcss or {}, {
        settings = {
          tailwindCSS = {
            classFunctions = { "cn", "cva", "clsx", "ctl", "cx", "tv", "tw", "twJoin", "twMerge" },
          },
        },
      })

      opts.servers.vtsls = vim.tbl_deep_extend("force", opts.servers.vtsls or {}, {
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = "non-relative",
              includePackageJsonAutoImports = "on",
              preferTypeOnlyAutoImports = true,
              quoteStyle = "auto",
            },
          },
          javascript = {
            preferences = {
              importModuleSpecifier = "non-relative",
              includePackageJsonAutoImports = "on",
              preferTypeOnlyAutoImports = true,
              quoteStyle = "auto",
            },
          },
        },
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs({
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "jsonc",
        "markdown",
        "markdown.mdx",
        "prisma",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      }) do
        opts.formatters_by_ft[ft] = { "prettierd", "prettier", stop_after_first = true }
      end
    end,
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft["*"] = opts.linters_by_ft["*"] or {}
      if not vim.tbl_contains(opts.linters_by_ft["*"], "typos") then
        table.insert(opts.linters_by_ft["*"], "typos")
      end
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    opts = {},
  },
}
