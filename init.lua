-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("luasnip").filetype_extend("php", { "html", "javascript" })
require("luasnip").filetype_extend("html", { "javascript", "php" })
