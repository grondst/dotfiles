return {
     {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true,
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    folds = false,
                    operators = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "",  -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {
                    NormalFloat = { bg = "#282828" },
                    PmenuSel = { bg="#504945", fg = "NONE" }, -- highlighted completion item
                    Pmenu = { bg = "#1d2021" }, -- completion menu background
                },
                dim_inactive = false,
                transparent_mode = false,
            })
            -- vim.cmd("colorscheme gruvbox")
        end,
    },
    {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup({
                transparent_background = false,
            })
        end
    },
    {
        "neanias/everforest-nvim",
          version = false,
          lazy = false,
          priority = 1000, -- make sure to load this before all the other start plugins
          -- Optional; default configuration will be used if setup isn't called.
          config = function()
            require("everforest").setup({
              -- Your config here
            })
          end,
    }
}

