return {
    "shaunsingh/nord.nvim",
    name = "nord",
    priority = 1000,
    config = function()
        -- require("nord").setup({})
        vim.o.termguicolors = true
        vim.cmd.colorscheme("nord")
    end,
}
