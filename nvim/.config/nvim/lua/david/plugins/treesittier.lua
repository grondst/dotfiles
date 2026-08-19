return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",

        config = function()
            local parsers = {
                "asm", "bash",                "c",
                "cpp",                "css",
                "go",                "html",
                "javascript",
                "typescript",
                "tsx",

                "json",

                "lua",

                "markdown",
                "markdown_inline",

                "python",

                "rust",

                "toml",

                "vim",
                "vimdoc",

                "yaml",

                "query",
            }

            require("nvim-treesitter").install(parsers)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",

                callback = function(args)
                    local buf = args.buf

                    local lang = vim.treesitter.language.get_lang(
                        vim.bo[buf].filetype
                    )

                    if not lang then
                        return
                    end

                    pcall(vim.treesitter.start, buf, lang)
                end,
            })
        end,
    },

    {
        "windwp/nvim-ts-autotag",

        ft = {
            "html",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
        },

        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false,
                },
            })
        end,
    },
}
