return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("lualine").setup({
            options = {
                theme = "gruvbox-material",
                icons_enabled = true,

                component_separators = {
                    left = "::",
                    right = "::",
                },

                section_separators = {
                    left = "",
                    right = "",
                },

                globalstatus = true,

                disabled_filetypes = {
                    statusline = {
                        "dashboard",
                        "alpha",
                        "neo-tree",
                    },
                },
            },

            sections = {
                -- Left
                lualine_a = {
                    {
                        "mode",
                        right_padding = 2,
                    },
                },

                lualine_b = {
                    {
                        "branch",
                        icon = "",
                    },
                    "diagnostics",
                },

                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                    },
                },

                -- Right
                lualine_x = {
                    -- {
                    --     function()
                    --         local clients = vim.lsp.get_clients({
                    --             bufnr = 0,
                    --         })
                    --
                    --         if #clients == 0 then
                    --             return ""
                    --         end
                    --
                    --         return clients[1].name
                    --     end,
                    --
                    --     icon = " ",
                    -- },
                    "encoding",
                    {
                      "fileformat",
                        symbols = {
                          unix = 'unix',
                          dos = "dos",
                          mac = "mac",
                        }
                    },
                    {
                      "filetype",
                      icons_enabled = false,
                    },
                },

                lualine_y = {
                    "progress",
                },

                lualine_z = {
                    "location",
                },
            },
        })
    end,
}
