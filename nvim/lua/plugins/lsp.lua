return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.enable({
            "clangd",
            "pyright",
            "lua_ls",
        })
    end
}
