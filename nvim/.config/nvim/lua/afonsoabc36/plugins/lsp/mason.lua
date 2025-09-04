return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                -- "bashls",
                -- "lua_ls",
                -- "rust_analyzer",
                -- "pyright",
                -- "omnisharp",
                -- "clangd",
                -- "html",
                -- "cssls",
                -- "jsonls",
                -- "tinymist",
            },
            handlers = {
                ["tinymist"] = function()
                    require("lspconfig")["tinymist"].setup({
                        capabilities = capabilities,
                        settings = {
                            formatterMode = "typstyle",
                            exportPdf = "never",
                        },
                    })
                end,
            },
        })
        local l = vim.lsp
        l.handlers["textDocument/hover"] = function(_, result, ctx, config)
            config = config or { border = "rounded", focusable = true }
            config.focus_id = ctx.method
            if not (result and result.contents) then
                return
            end
            local markdown_lines = l.util.convert_input_to_markdown_lines(result.contents)
            markdown_lines = vim.tbl_filter(function(line)
                return line ~= ""
            end, markdown_lines)
            if vim.tbl_isempty(markdown_lines) then
                return
            end
            return l.util.open_floating_preview(markdown_lines, "markdown", config)
        end

        mason_tool_installer.setup({
            ensure_installed = {
                "stylua",
                "prettier",
                "pylint",
                "eslint_d",
                "shellcheck",
                "shfmt",
            },
        })
    end,
}
