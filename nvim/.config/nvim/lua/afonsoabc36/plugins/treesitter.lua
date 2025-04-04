return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = { "windwp/nvim-ts-autotag" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
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
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
