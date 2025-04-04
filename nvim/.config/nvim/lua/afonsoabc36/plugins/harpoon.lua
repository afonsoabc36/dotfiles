return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local harpoonMarks = require("harpoon.mark")
		local harpoonUI = require("harpoon.ui")
		harpoon.setup({
			global_settings = {
				-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
				save_on_toggle = false,
				-- saves the harpoon file upon every change. disabling is unrecommended.
				save_on_change = true,
				-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
				enter_on_sendcmd = false,
				-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
				tmux_autoclose_windows = false,
				-- filetypes that you want to prevent from adding to the harpoon list menu.
				excluded_filetypes = { "harpoon" },
				-- set marks specific to each git branch inside git repository
				mark_branch = false,
				-- enable tabline with harpoon marks
				tabline = false,
				tabline_prefix = "   ",
				tabline_suffix = "   ",
			},
		})

		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "<leader>a", function()
			harpoonMarks.add_file()
		end, opts)
		vim.keymap.set("n", "<C-h>", function()
			harpoonUI.toggle_quick_menu()
		end, opts)
		vim.keymap.set("n", "<M-1>", function()
			harpoonUI.nav_file(1)
		end, opts)
		vim.keymap.set("n", "<M-2>", function()
			harpoonUI.nav_file(2)
		end, opts)
		vim.keymap.set("n", "<M-3>", function()
			harpoonUI.nav_file(3)
		end, opts)
		vim.keymap.set("n", "<M-4>", function()
			harpoonUI.nav_file(4)
		end, opts)
	end,
}
