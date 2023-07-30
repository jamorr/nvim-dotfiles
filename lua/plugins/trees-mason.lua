return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "c",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "css",
        "php",
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "ruff",
        "ruff-lsp",
        "clang-format",
        "autopep8",
        "css-lsp",
        "stylelint",
        "cssmodules-language-server",
        "prettierd",
        "tailwindcss-language-server",
        "unocss-language-server",
        "php-debug-adapter",
        -- "phpactor",
        "pyright",
        "psalm",
        "phpcbf",
        "pint",
        "nimlangserver"
      },
    },
  },
}
