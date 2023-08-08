return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          --add more to this list later
          -- nls.builtins.formatting.clangd,
          -- nls.builtins.formatting.blue,
          nls.builtins.diagnostics.flake8,
          nls.builtins.formatting.autopep8,
          -- nls.builtins.formatting.ruff,
          -- nls.builtins.formatting.black,
          nls.builtins.formatting.nimpretty,
          -- nls.builtins.formatting.rustfmt,
          -- nls.builtins.formatting.blade_formatter,
          -- nls.builtins.diagnostics.eslint_d.with({
          --   condition = function(utils)
          --     return utils.root_has_file({ ".eslintrc.json" })
          --   end,
          -- }),
          -- nls.builtins.diagnostics.phpcs,
          -- nls.builtins.diagnostics.psalm,
          nls.builtins.formatting.phpcbf,
          -- nls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { "NvimTree" } }),
          -- nls.builtins.formatting.eslint_d.with({
          --   condition = function(utils)
          --     return utils.root_has_file({ ".eslintrc.json" })
          --   end,
          -- }),
          nls.builtins.formatting.prettierd,
          -- nls.builtins.formatting.rustywind.with({
          --   extra_filetypes = { "blade" },
          -- }),
          -- nls.builtins.diagnostics.phpstan,
          -- nls.builtins.diagnostics.hadolint,
          --
          -- this give broken completions
          -- nls.builtins.completion.luasnip,
          -- nls.builtins.code_actions.eslint,
        },
        -- autostart = true,
      }
    end,
  },
}
