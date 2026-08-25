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
                "sqlls",
                "dockerls",
                "docker_compose_language_service",
                "basedpyright",
                "gopls",
                "ts_ls",
                "bashls",
                "emmet_language_server",
                "emmet_ls",
                "tailwindcss",
                "html",
                "cssls",
                "yamlls",
                "taplo",
                "marksman",
                "jsonls",
                "clangd",
                "lua_ls",
                "zls",
            },

            automatic_enable = false,
        },
    },
}
