-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end
-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = { no_italic = true }
  },
  {
    "lazyvim/lazyvim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  --
  -- change trouble config
  -- {
  --   "folke/trouble.nvim",
  --   -- opts will be merged with the parent spec
  --   opts = { use_diagnostic_signs = true },
  --
  -- -- disable trouble
  -- { "folke/trouble.nvim", enabled = false },

  -- add symbols-outline
  -- {
  --   "simrat39/symbols-outline.nvim",
  --   cmd = "symbolsoutline",
  --   keys = { { "<leader>cs", "<cmd>symbolsoutline<cr>", desc = "symbols outline" } },
  --   config = true,
  -- },

  -- override nvim-cmp and add cmp-emoji
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "hrsh7th/cmp-emoji" },
  --   ---@param opts cmp.configschema
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --     opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
  --   end,
  -- },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "find plugin file",
      },
    },
    -- change some options
    --   opts = {
    --     defaults = {
    --       layout_strategy = "horizontal",
    --       layout_config = { prompt_position = "top" },
    --       sorting_strategy = "ascending",
    --       winblend = 0,
    --     },
    --   },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  -- {
  --   "echasnovski/mini.pairs",
  --   event = "verylazy",
  --   opts = {},
  -- },
  -- -- add illuminate
  -- {
  --   "rrethy/vim-illuminate",
  --   event = { "bufreadpost", "bufnewfile" },
  --   opts = {
  --     delay = 200,
  --     large_file_cutoff = 2000,
  --     large_file_overrides = {
  --       providers = { "lsp" },
  --     },
  --   },
  --   config = function(_, opts)
  --     require("illuminate").configure(opts)
  --
  --     local function map(key, dir, buffer)
  --       vim.keymap.set("n", key, function()
  --         require("illuminate")["goto_" .. dir .. "_reference"](false)
  --       end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " reference", buffer = buffer })
  --     end
  --
  --     map("]]", "next")
  --     map("[[", "prev")
  --
  --     -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
  --     vim.api.nvim_create_autocmd("filetype", {
  --       callback = function()
  --         local buffer = vim.api.nvim_get_current_buf()
  --         map("]]", "next", buffer)
  --         map("[[", "prev", buffer)
  --       end,
  --     })
  --   end,
  --   keys = {
  --     { "]]", desc = "next reference" },
  --     { "[[", desc = "prev reference" },
  --   },
  -- },
}
-- add tsserver and setup with typescript.nvim instead of lspconfig
-- {
--   "neovim/nvim-lspconfig",
--   dependencies = {
--     "jose-elias-alvarez/typescript.nvim",
--     init = function()
--       require("lazyvim.util").on_attach(function(_, buffer)
--         -- stylua: ignore
--         vim.keymap.set( "n", "<leader>co", "typescriptorganizeimports", { buffer = buffer, desc = "organize imports" })
--         vim.keymap.set("n", "<leader>cr", "typescriptrenamefile", { desc = "rename file", buffer = buffer })
--       end)
--     end,
--   },
--   ---@class pluginlspopts
--   opts = {
--     ---@type lspconfig.options
--     servers = {
--       -- tsserver will be automatically installed with mason and loaded with lspconfig
--       tsserver = {},
--     },
--     -- you can do any additional lsp server setup here
--     -- return true if you don't want this server to be setup with lspconfig
--     ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
--     setup = {
--       -- example to setup with typescript.nvim
--       tsserver = function(_, opts)
--         require("typescript").setup({ server = opts })
--         return true
--       end,
--       -- specify * to use this function as a fallback for any server
--       -- ["*"] = function(server, opts) end,
--     },
--   },
-- },

-- for typescript, lazyvim also includes extra specs to properly setup lspconfig,
-- treesitter, mason and typescript.nvim. so instead of the above, you can use:
-- { import = "lazyvim.plugins.extras.lang.typescript" },

-- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
-- would overwrite `ensure_installed` with the new value.
-- if you'd rather extend the default config, use the code below instead:

-- the opts function can also be used to change the default opts:
-- {
--   "nvim-lualine/lualine.nvim",
--   event = "verylazy",
--   opts = function(_, opts)
--     table.insert(opts.sections.lualine_x, "😄")
--   end,
-- },

-- or you can return new options to override all the defaults
-- {
--   "nvim-lualine/lualine.nvim",
--   event = "verylazy",
--   opts = function()
--     return {
--       --[[add your custom lualine config here]]
--     }
--   end,
-- },

-- add any tools you want to have installed below
-- use <tab> for completion and snippets (supertab)
-- first: disable default <tab> and <s-tab> behavior in luasnip
