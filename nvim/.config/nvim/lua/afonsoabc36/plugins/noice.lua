return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	config = function()
		-- Set up noice.nvim and other settings here if needed
		require("noice").setup({
			-- Noice-specific configuration (if any)
		})

		-- Now configure nvim-notify
		require("notify").setup({
			timeout = 500, -- 2000 milliseconds = 2 seconds (adjust this value as needed)
			max_width = 40,
			max_height = 20,
			render = "wrapped-compact",
		})
	end,
}
