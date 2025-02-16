return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff" },
				rust = { "rustfmt" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				go = { "gofumpt", "golines", "goimports-reviser" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				haskell = { "ormolu" },
				markdown = { "prettier" },
				html = { "prettier" },
				sql = { "sqlfmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})
	end,
}
