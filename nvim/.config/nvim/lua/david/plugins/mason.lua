return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        "mason-org/mason-lspconfig.nvim",

        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },

        opts = {
            ensure_installed = {
                "rust_analyzer",
                "basedpyright",
                "gopls",
                "ts_ls",
                "bashls",
                "html",
                "cssls",
                "yamlls",
                "taplo",
                "jsonls",
                "clangd",
                "lua_ls",
            },

            automatic_enable = false,
        },
    },
}
