return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,

	opts = {
		ensure_installed = {
			"c",
			"c_sharp",
			"diff",
			"html",
			"javascript",
			"json",
			"lua",
			"luadoc",
			"markdown",
			"python",
			"vim",
			"vimdoc",
			"go",
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = { enable = true, disable = { "ruby" } },
		autotag = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.install").prefer_git = true
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup(opts)
	end,
}
