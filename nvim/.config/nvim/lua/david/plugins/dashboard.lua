return {
    "nvimdev/dashboard-nvim",

    -- lazy = false,
    -- priority = 1000,

    dependencies = {
        -- "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("dashboard").setup({
            theme = "hyper",

            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    {
                        desc = "Update",
                        group = "@property",
                        action = "Lazy update",
                        key = "u",
                    },

                    {
                        desc = "Files",
                        group = "Label",
                        action = "Telescope find_files",
                        key = "f",
                    },

                    {
                        desc = "Recent",
                        group = "Label",
                        action = "Telescope oldfiles",
                        key = "r",
                    },

                    {
                        desc = "Config",
                        group = "Label",
                        action = function()
                            vim.cmd("edit " .. vim.fn.stdpath("config") .. "/init.lua")
                        end,
                        key = "c",
                    },
                },

                footer = {
                    "",
                    "Love parents, and eat porridge",
                },
            },
        })
    end,
}
