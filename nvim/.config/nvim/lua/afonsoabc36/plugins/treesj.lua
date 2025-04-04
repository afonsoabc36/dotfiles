return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local treesj = require("treesj")
		treesj.setup({}) -- You can add specific configuration options here if needed

		local keymap = vim.keymap -- Alias for cleaner code
		keymap.set("n", "<leader>tT", treesj.toggle, { desc = "[T]oggle [T]reesj" })
		keymap.set("n", "<leader>te", treesj.split, { desc = "[T]oggle [E]xpand Code Block" })
		keymap.set("n", "<leader>tc", treesj.join, { desc = "[T]oggle [C]ollapse Code Block" })
	end,
}
