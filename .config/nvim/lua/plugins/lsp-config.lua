return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "tsserver", "gopls", "svelte", "tailwindcss" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- lsp keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

            -- lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            -- typescript/javascript
            lspconfig.tsserver.setup({
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("package.json"),
                filetypes = {
                    "typescript",
                    "typescriptreact",
                    "typescript.tsx",
                    "javascript",
                    "javascriptreact",
                    "javascript.jsx",
                },
            })

            -- tailwindcss
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })

            -- gopls
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            -- svelte
            lspconfig.svelte.setup({
                capabilities = capabilities,
            })

            -- docker
            lspconfig.dockerls.setup({
                capabilities = capabilities,
            })

            -- zig
            lspconfig.zls.setup({
                capabilities = capabilities,
            })

            -- deno
            lspconfig.denols.setup({
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
            })
        end,
    },
}
