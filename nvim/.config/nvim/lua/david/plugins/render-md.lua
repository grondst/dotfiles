return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        ft = { "markdown", "norg", "rmd", "org" },
        opts = {
            heading = {
                sign = true,
            },
            code = {
                sign = false,
                style = "full",
                border = "thick",
            },
        },
    },
}
