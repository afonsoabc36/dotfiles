return {
	"mfussenegger/nvim-lint",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufRead", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			lua = { "luacheck" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			c = { "clangtidy" },
			cpp = { "clangtidy" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
