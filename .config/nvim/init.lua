vim.api.nvim_set_hl(0, "Comment", { fg = "#544F4F" })
vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })

require('me.options')
require('me.globals')
require('me.lualine')
require('me.keymap')
require('me.lsp')
require('me.telescope')
