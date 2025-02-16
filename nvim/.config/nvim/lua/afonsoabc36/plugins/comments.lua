return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	config = function()
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		comment.setup({
			padding = true, -- Add a space between comment and text
			sticky = true, -- Keep cursor in the same column when commenting
			ignore = "^$", -- Ignore empty lines when commenting
			mappings = {
				basic = true, -- Include basic mappings
				extra = true, -- Include extra mappings
			},
			toggler = {
				line = "gc", -- Toggle line comment
				block = "gC", -- Toggle block comment
			},
			opleader = {
				line = "gc", -- Operator mode line comment
				block = "gC", -- Operator mode block comment
			},
			extra = {
				above = "gca", -- Comment above
				below = "gcb", -- Comment below
				eol = "gce", -- Comment at end of line
			},
			pre_hook = ts_context_commentstring.create_pre_hook(), -- Context-aware comment strings
			post_hook = function() end, -- Function to run after comment
		})
	end,
}
