return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "saghen/blink.cmp",
        },

        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            local servers = {
                "lua_ls",
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
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })
            end

            -- Lua / Neovim
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },

                        workspace = {
                            checkThirdParty = false,
                            library = vim.api.nvim_get_runtime_file("", true),
                        },

                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -- Rust
            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                        },

                        check = {
                            command = "clippy",
                        },
                    },
                },
            })

            -- Python
            vim.lsp.config("basedpyright", {
                settings = {
                    basedpyright = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                        },
                    },
                },
            })

            -- Diagnostics
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,

                float = {
                    border = "rounded",
                    source = "if_many",
                },
            })

            -- LSP keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local opts = {
                        buffer = args.buf,
                        silent = true,
                    }

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
                        buffer = args.buf,
                        desc = "Go to definition",
                    })

                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
                        buffer = args.buf,
                        desc = "Go to declaration",
                    })

                    vim.keymap.set("n", "gr", vim.lsp.buf.references, {
                        buffer = args.buf,
                        desc = "Find references",
                    })

                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
                        buffer = args.buf,
                        desc = "Go to implementation",
                    })

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, {
                        buffer = args.buf,
                        desc = "Hover documentation",
                    })

                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
                        buffer = args.buf,
                        desc = "Rename",
                    })

                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
                        buffer = args.buf,
                        desc = "Code action",
                    })
                end,
            })

            vim.lsp.enable(servers)
        end,
    },
}
