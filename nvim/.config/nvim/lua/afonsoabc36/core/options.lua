vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Mouse support
opt.mouse = "a"

-- Don't show what mode it is in, since it is already in the status line
opt.showmode = false

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Clipboard
-- opt.clipboard = "unnamedplus"

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time, displays which-key popup sooner
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Preview substitutions live, as you type!
opt.inccommand = "split"

-- Show which line and column your cursor is on
opt.cursorline = true
opt.cursorcolumn = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 15

-- Set highlight on search, but clear on pressing <Esc> in normal mode
opt.hlsearch = true

-- Better color display
opt.termguicolors = true
