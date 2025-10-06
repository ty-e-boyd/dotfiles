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
                ensure_installed = { "lua_ls", "ts_ls", "gopls", "svelte", "tailwindcss" },
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
            vim.lsp.config('lua_ls', {
                cmd = { 'lua-language-server' },
                capabilities = capabilities,
                root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
            })

            -- typescript/javascript
            vim.lsp.config('ts_ls', {
                cmd = { 'typescript-language-server', '--stdio' },
                capabilities = capabilities,
                root_markers = { 'package.json' },
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
            vim.lsp.config('tailwindcss', {
                cmd = { 'tailwindcss-language-server', '--stdio' },
                capabilities = capabilities,
                root_markers = { 'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts' },
            })

            -- ruby/rails - solargraph
            vim.lsp.config('solargraph', {
                cmd = { 'solargraph', 'stdio' },
                capabilities = capabilities,
                root_markers = { 'Gemfile', '.git' },
                settings = {
                    solargraph = {
                        diagnostics = true
                    }
                }
            })

            -- gopls
            vim.lsp.config('gopls', {
                cmd = { 'gopls' },
                capabilities = capabilities,
                root_markers = { 'go.work', 'go.mod', '.git' },
            })

            -- svelte
            vim.lsp.config('svelte', {
                cmd = { 'svelteserver', '--stdio' },
                capabilities = capabilities,
                root_markers = { 'package.json', '.git' },
            })

            -- docker
            vim.lsp.config('dockerls', {
                cmd = { 'docker-langserver', '--stdio' },
                capabilities = capabilities,
                root_markers = { 'Dockerfile' },
            })

            -- zig
            vim.lsp.config('zls', {
                cmd = { 'zls' },
                capabilities = capabilities,
                root_markers = { 'zls.json', 'build.zig', '.git' },
            })
            vim.g.zig_fmt_autosave = 0

            -- deno
            vim.lsp.config('denols', {
                cmd = { 'deno', 'lsp' },
                capabilities = capabilities,
                root_markers = { 'deno.json', 'deno.jsonc' },
            })

            -- Enable all configs
            vim.lsp.enable({
                'lua_ls',
                'ts_ls',
                'tailwindcss',
                'solargraph',
                'gopls',
                'svelte',
                'dockerls',
                'zls',
                'denols',
            })
        end,
    },
}
