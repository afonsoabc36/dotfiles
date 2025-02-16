return {
	"folke/todo-comments.nvim",
	event = { "BufRead", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local todo = require("todo-comments")
		local keymap = vim.keymap

		keymap.set("n", "tn", function()
			todo.jump_next()
		end, { desc = "[T]odo [N]ext comment" })

		keymap.set("n", "tp", function()
			todo.jump_prev()
		end, { desc = "[T]odo [P]revious comment" })

		todo.setup()
	end,
}
