return {
	"williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require('mason').setup()
		require('mason-lspconfig').setup()

        require("mason-lspconfig").setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function (server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {}
            end,
            -- Next, you can provide a dedicated handler for specific servers.
            -- For example, a handler override for the `rust_analyzer`:
            -- ["rust_analyzer"] = function ()
            --    require("rust-tools").setup {}
            -- end
        }

        vim.diagnostic.config({float = { source = true }})
        vim.keymap.set('n', '<leader>a', "<cmd>lua vim.lsp.buf.code_action()<CR>")
        vim.keymap.set('n', '<leader>d', "<cmd>lua vim.diagnostic.open_float()<CR>")
    end,
}
