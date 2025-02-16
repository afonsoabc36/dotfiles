return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter", -- optional optimization
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
