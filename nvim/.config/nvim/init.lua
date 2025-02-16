-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.cmd("let g:netrw_liststyle = 3")

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true
-- Number of spaces in a tab
vim.opt.tabstop = 4
-- Number of spaces used for each step of (auto)indent
vim.opt.shiftwidth = 4
-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--vim.opt.list = true
--vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- vim.keymap.set("n", "j", "gj")
-- vim.keymap.set("n", "k", "gk")

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Custom Keymaps
-- Delete until the end of line
vim.api.nvim_set_keymap("n", "dl", "d$", { desc = "[D]elete rest of [L]ine", noremap = true, silent = true })
-- Move between open windows
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Focus left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Focus below window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Focus above window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Focus right window" })
-- Save file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save File" })
-- Copy from the clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+yy', { desc = "Copy whole line to clipboard" })
-- Paste from the clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from cl  ipboard" })
-- Copies a line down
vim.keymap.set("n", "<leader>cd", "yyp", { desc = "[C]opy a line [D]own" })
-- Open file explorer
vim.keymap.set("n", "<leader>ft", vim.cmd.Ex, { desc = "Go to File Tree" })
-- Create new file in file explorer
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		-- Create a new file with 'f'
		vim.keymap.set({ "n", "v" }, "f", function()
			vim.fn.feedkeys("%")
		end, { buffer = true, desc = "Create new file in netrw" })
	end,
})
-- Indent in Visal mode
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent right in visual mode" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("n", "<Tab>", "v><Esc>", { desc = "Indent right in normal mode" })
vim.keymap.set("n", "<S-Tab>", "v<<Esc>", { desc = "Indent left in normal mode" })
-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", ":m .+1<CR>==")
vim.keymap.set("n", "K", ":m .-2<CR>==")

-- Better scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Centering search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Paste and replace
vim.keymap.set("x", "<leader>P", [["_dP]], { desc = "[P]aste and replace text selected" })
-- Delete without copying to the paste clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- Insert a new line below the current line in normal mode
vim.keymap.set({ "n", "v" }, "<Enter>", "o<Esc>", { desc = "Insert new line below in normal mode" })
-- Ctrl-c to go back to normal mode
vim.keymap.set("i", "<C-c>", "<Esc>")
-- Substitute word under cursor
vim.keymap.set(
	"n",
	"<leader>fr",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]],
	{ desc = "[S]ubstitutue word under the cursor" }
)

-- Temux
-- vim.keymap.set("n", "<C->", "<cmd>silent !~/scripts/tmux-sessionizer<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<C-b>", "<C-o>", { desc = "Go [B]ack" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Lazy git configuration
vim.g.lazygit_floating_window_winblend = 20 -- Transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- Scaling factor for floating window

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- NOTE: Plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	--
	-- Use `opts = {}` to force a plugin to be loaded.
	--
	--  This is equivalent to:
	--    require('Comment').setup({})

	-- "gc" to comment visual regions/lines
	{
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
	},

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},

	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>m", ":MaximizerToggle<CR>", desc = "[M]aximize Buffer" },
		},
	},

	{
		"rmagatti/auto-session",
		config = function()
			local auto_session = require("auto-session")

			auto_session.setup({
				auto_restore_enabled = false,
				auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
			})

			local keymap = vim.keymap

			keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
			keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
		end,
	},

	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Set header
			dashboard.section.header.val = {
				"                                                     ",
				"                                                     ",
				"                                                     ",
				"                                                     ",
				"                                                     ",
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                     ",
				"                                                     ",
				"                                                     ",
				"                                                     ",
				"                                                     ",
				"                                                     ",
			}

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("<leader>wr", "󰁯  > Restore Session", "<cmd>SessionRestore<CR>"),
				dashboard.button("<leader>ft", "  > File Tree", "<cmd>Ex<CR>"),
				dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
				dashboard.button("<leader>ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
				dashboard.button("<leader>fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
				dashboard.button(":qa", "  > Quit NVIM", "<cmd>qa<CR>"),
			}

			-- Send config to alpha
			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		end,
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = {},
					rust = { "rustfmt" },
					javascript = { "prettier", stop_after_first = true },
					javascriptreact = { "prettier", stop_after_first = true },
					typescript = { "prettier", stop_after_first = true },
					typescriptreact = { "prettier", stop_after_first = true },
					json = { "prettier", stop_after_first = true },
					go = { "gofumpt", "golines", "goimports-reviser" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					haskell = { "ormolu" },
					markdown = { "prettier" },
					html = { "prettier" },
					sql = { "sqlfmt" },
				},
				formatters = {
					prettier = {
						timeout_ms = 5000,
					},
				},
				format_on_save = {
					timeout_ms = 5000,
					lsp_format = "fallback",
				},
			})
		end,
	},
	-- Plugin maybe, tabout

	-- Treesj, expand or colapse a list, function etc, multiple lines to 1 line, or vice versa
	{
		"Wansmer/treesj",
		keys = { "<leader>tt", "<leader>te", "<leader>tc" },
		dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
		config = function()
			require("treesj").setup({})
			vim.keymap.set("n", "<leader>tt", require("treesj").toggle, { desc = "[T]oggle [T]reesj" })
			vim.keymap.set("n", "<leader>te", require("treesj").split, { desc = "[T]oggle [E]xpand Code Block" }) -- Expand to multiple lines
			vim.keymap.set("n", "<leader>tc", require("treesj").join, { desc = "[T]oggle [C]olapse Code Block" }) -- Colapse to single line
		end,
	},

	-- Colorizer, displays color codes in the editor
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"*",
				css = { rgb_fn = true },
			})
		end,
	},

	--Render notebook files
	{
		"meatballs/notebook.nvim",
		config = function()
			require("notebook").setup({
				insert_blank_line = true,
				show_index = true,
				show_cell_type = true,
				virtual_text_style = { fg = "lightblue", italic = true },
			})
		end,
	},

	--Render markdown files
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		config = function()
			require("render-markdown").setup({})
		end,
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
	},
	-- Typst preview
	{
		"chomosuke/typst-preview.nvim",
		lazy = false, -- or ft = 'typst'
		version = "1.*",
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
		config = function()
			vim.keymap.set(
				"n",
				"<leader>tp",
				":TypstPreviewToggle<CR>:TypstPreviewFollowCursor<CR>",
				{ desc = "Start markdown preview" }
			)
		end,
	},

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewToggle" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		config = function()
			vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Start markdown preview" })
			vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { desc = "Stop markdown preview" })
		end,
	},

	-- Autopairs and cmp integration
	{
		"windwp/nvim-autopairs",
		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({})

			-- nvim-cmp integration with autopairs
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<S-CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<Up>"] = cmp.mapping(function(fallback)
						fallback() -- Just fallback to default behavior (moving up)
					end),
					["<Down>"] = cmp.mapping(function(fallback)
						fallback() -- Just fallback to default behavior (moving down)
					end),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					}),
					expandable_indicator = true, -- optional, to show expandable items
				},
			})
		end,
	},

	-- Surround plugin for surrounding text
	{
		"kylechui/nvim-surround",
		version = "*", -- Use the latest stable version
		event = "VeryLazy", -- Lazy load to avoid performance issues
		config = function()
			require("nvim-surround").setup({
				-- Optional custom configuration goes here
			})
		end,
	},

	{
		"mfussenegger/nvim-lint",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufRead", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				lua = { "luacheck" },
				javascript = { "eslint" },
				typescript = { "eslint" },
				c = { "clangtidy" },
				cpp = { "clangtidy" },
				-- python = { "pylint" },
			}
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	-- Here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
	--    require('gitsigns').setup({ ... })
	--
	-- See `:help gitsigns` to understand what the configuration keys do
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			signs_staged = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
	--
	-- This is often very useful to both group configuration, as well as handle
	-- lazy loading plugins that don't need to be loaded immediately at startup.
	--
	-- For example, in the following configuration, we use:
	--  event = 'VimEnter'
	--
	-- which loads which-key before all the UI elements are loaded. Events can be
	-- normal autocommands events (`:help autocmd-events`).
	--
	-- Then, because we use the `config` key, the configuration only runs
	-- after the plugin has been loaded:
	--  config = function() ... end

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP support
			"neovim/nvim-lspconfig",

			-- Autocompletetion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",

			-- Snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	{
		"easymotion/vim-easymotion",
		config = function()
			-- Basic configuration
			vim.g.EasyMotion_do_mapping = 0 -- Disable default mappings
			-- vim.api.nvim_set_keymap("n", "<Leader><Leader>s", "<Plug>(easymotion-overwin-f)", {})
			vim.api.nvim_set_keymap("n", "ç", "<Plug>(easymotion-overwin-f)", {})
			vim.api.nvim_set_keymap("n", "<Leader><Leader>f", "<Plug>(easymotion-bd-f)", {})
			vim.api.nvim_set_keymap("n", "<Leader><Leader>w", "<Plug>(easymotion-s2)", {})
		end,
	}, -- nvim v0.8.0

	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local mode = {
				"mode",
				-- icons_enabled = true,
				-- icon = "",
				fmt = function(str)
					return " " .. str .. " "
					-- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
				end,
			}

			local branch = {
				"branch",
				icons_enabled = true,
				icon = "",
			}

			local icons = {
				lua = "󰢱",
				python = "",
				rust = "",
				typescript = "",
				javascript = "",
				html = "",
				css = "",
				json = "",
				yaml = "",
				md = "",
				mdx = "",
				gitignore = "",
				gitattributes = "",
				gitcommit = "",
				gitrebase = "",
				gitconfig = "",
				git = "",
				c = "",
				cpp = "",
				java = "",
				bash = "",
				sh = "",
				default = "",
				dockerfile = "",
				dockercompose = "",
			}

			local filename = function()
				local filetype = vim.bo.filetype
				local icon = icons[filetype] or icons["default"]
				local name = vim.fn.expand("%:t") -- Gets the filename, just the name

				return icon .. " " .. name
			end

			local hide_in_width = function()
				return vim.fn.winwidth(0) > 100
			end

			local diagnostics = {
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				colored = false,
				update_in_insert = false,
				always_visible = false,
				cond = hide_in_width,
			}

			local filetype = function()
				local ft = vim.bo.filetype
				return icons[ft] .. " " .. ft:sub(1, 1):upper() .. ft:sub(2)
			end

			local diff = {
				"diff",
				colored = false,
				symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
				cond = hide_in_width,
			}

			local clock = function()
				return " " .. os.date("%H:%M")
			end

			local colors = {
				blue = "#65D1FF",
				green = "#3EFFDC",
				violet = "#FF61EF",
				yellow = "#FFDA7B",
				red = "#FF4A4A",
				fg = "#c3ccdc",
				bg = "#112638",
				inactive_bg = "#2c3043",
			}

			local my_lualine_theme = {
				normal = {
					a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				insert = {
					a = { bg = colors.green, fg = colors.bg, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				visual = {
					a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				command = {
					a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				replace = {
					a = { bg = colors.red, fg = colors.bg, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				inactive = {
					a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
					b = { bg = colors.inactive_bg, fg = colors.semilightgray },
					c = { bg = colors.inactive_bg, fg = colors.semilightgray },
				},
			}

			require("lualine").setup({
				options = {
					icons_enabled = false,
					theme = my_lualine_theme, -- Set theme based on environment variable
					-- Some useful glyphs:
					-- https://www.nerdfonts.com/cheat-sheet
					--          
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					disabled_filetypes = { "alpha", "neo-tree" },
					always_divide_middle = true,
				},
				sections = {
					lualine_a = { mode },
					lualine_b = { branch },
					lualine_c = { filename },
					lualine_x = {
						diagnostics,
						diff,
						{ "encoding", cond = hide_in_width },
						{ filetype },
					},
					lualine_y = { "location" },
					lualine_z = { clock },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { { filename, path = 0 } },
					lualine_x = { filetype },
					lualine_y = { { "location", padding = 0 } },
					lualine_z = {},
				},
				tabline = {},
				extensions = { "fugitive" },
			})
		end,
	},
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		keys = { -- load the plugin only when using it's keybinding:
			{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},

	-- NOTE: Plugins can specify dependencies.
	--
	-- The dependencies are proper plugin specifications as well - anything
	-- you do for a plugin at the top level, you can do for a dependency.
	--
	-- Use the `dependencies` key to specify the dependencies of a particular plugin

	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
			"folke/todo-comments.nvim",
		},
		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! It's more than just a "file finder", it can search
			-- many different aspects of Neovim, your workspace, LSP, and more!
			--
			-- The easiest way to use Telescope, is to start by doing something like:
			--  :Telescope help_tags
			--
			-- After running this command, a window will open up and you're able to
			-- type in the prompt window. You'll see a list of `help_tags` options and
			-- a corresponding preview of the help.
			--
			-- Two important keymaps to use while in Telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--
			-- This opens a window that shows you all of the keymaps for the current
			-- Telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({
				-- You can put your default mappings / updates / etc. in here
				--  All the info you're looking for is in `:help telescope.setup()`
				--
				-- defaults = {
				--   mappings = {
				--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				--   },
				-- },
				pickers = {
					find_files = {
						file_ignore_patterns = { "node_modules" },
					},
				},
				live_grep = {
					file_ignore_patterns = { "node_modules" },
					additional_args = function(_)
						return { "--hidden" }
					end,
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "[F]ind [G]it Files" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>fs", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end, { desc = "[F]ind [S]tring occurences" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ld Recent Files" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing [B]uffers" })
			vim.keymap.set("n", "<leader>fc", "<cmd>TodoTelescope<cr>", { desc = "[F]ind [T]odo comments" })

			vim.keymap.set("n", "<C-p>", vim.cmd.cprev)
			vim.keymap.set("n", "<C-n>", vim.cmd.cnext)
			vim.keymap.set("n", "<C-j>", vim.cmd.split) -- Open a new horizontal split
			vim.keymap.set("n", "<C-l>", vim.cmd.vsplit) -- Open a new vertical split
			vim.keymap.set({ "n", "v" }, "s", "", { noremap = true }) -- Disable s motion, it eliminates a character and goes to insert mode

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"pyright",
					"omnisharp",
					"clangd",
					"html",
					"cssls",
					"jsonls",
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"stylua",
					"prettier",
					-- "pylint",
					-- "eslint_d",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(event)
					local opts = { buffer = event.buf, silent = true }
					opts.desc = "Show LSP references"
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					vim.api.nvim_buf_set_keymap(event.buf, "n", "K", ":m .-2<CR>==", { noremap = true, silent = true })
					vim.api.nvim_buf_set_keymap(event.buf, "n", "J", ":m .+1<CR>==", { noremap = true, silent = true })

					-- Jump to the definition of the word under your cursor.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					-- Find references for the word under your cursor.
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					-- Jump to the type of the word under your cursor.
					map("<C-t>", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					-- Fuzzy find all the symbols in your current document.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

					-- Fuzzy find all the symbols in your current workspace.
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace S[Y]mbols"
					)

					-- Rename the variable under your cursor.
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					-- Opens a popup that displays documentation about the word under your cursor
					map("<C-k>", vim.lsp.buf.hover, "Hover Documentation")

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header.
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				end,
			})

			local capabilities = cmp_nvim_lsp.default_capabilities()

			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					-- configure lua server (with special settings)
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								-- make the language server recognize "vim" global
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,
			})
		end,
	},

	-- Auto-Completion Text Suggestions Codeium
	{
		"Exafunction/codeium.vim",
		event = "InsertEnter",
		config = function()
			vim.keymap.set("i", "<S-Tab>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<S-Down>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<S-Up>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<A-Tab>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},

	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		init = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("tokyonight-night")

			-- You can configure highlights by doing something like:
			vim.cmd.hi("Comment gui=none")
		end,
	},

	-- Highlight todo, notes, etc in comments
	{
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
	},

	-- Alloy Syntax Support
	{ "runoshun/vim-alloy" },

	{
		"echasnovski/mini.surround",
		opts = {
			-- Add custom surroundings to be used on top of builtin ones. For more
			-- information with examples, see `:h MiniSurround.config`.
			custom_surroundings = nil,

			-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
			highlight_duration = 500,

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},

			-- Number of lines within which surrounding is searched
			n_lines = 20,

			-- Whether to respect selection type:
			-- - Place surroundings on separate lines in linewise mode.
			-- - Place surroundings on each line in blockwise mode.
			respect_selection_type = false,

			-- How to search for surrounding (first inside current line, then inside
			-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
			-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
			-- see `:h MiniSurround.config`.
			search_method = "cover",

			-- Whether to disable showing non-error feedback
			silent = false,
		},
	},

	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter", -- optional optimization
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"echasnovski/mini.ai",
		version = "*",
	},

	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
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
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
			autotag = { enable = true },
		},
		config = function(_, opts)
			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

			-- Prefer git instead of curl in order to improve connectivity in some environments
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)

			-- There are additional nvim-treesitter modules that you can use to interact
			-- with nvim-treesitter. You should go explore a few and see what interests you:
			--
			--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},

	-- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
	-- init.lua. If you want these files, they are in the repository, so you can just download them and
	-- place them in the correct locations.

	-- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
	--
	--  Here are some example plugins that I've included in the Kickstart repository.
	--  Uncomment any of the lines below to enable them (you will need to restart nvim).
	--
	require("kickstart.plugins.debug"),
	-- require 'kickstart.plugins.indent_line',
	-- require 'kickstart.plugins.lint',
	-- require 'kickstart.plugins.autopairs',
	-- require 'kickstart.plugins.neo-tree',
	-- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    This is the easiest way to modularize your config.
	--
	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	--    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
	-- { import = 'custom.plugins' },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
