vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Visual up and down on wrapped lines
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

-- Diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Delete until the end of line
vim.api.nvim_set_keymap("n", "dl", "d$", { desc = "[D]elete rest of [L]ine", noremap = true, silent = true })

-- Move between open windows
keymap.set("n", "<leader>h", "<C-w>h", { desc = "Focus left window" })
keymap.set("n", "<leader>j", "<C-w>j", { desc = "Focus below window" })
keymap.set("n", "<leader>k", "<C-w>k", { desc = "Focus above window" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Focus right window" })

-- Save file
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save File" })

-- Copy to the clipboard
keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
keymap.set({ "n", "v" }, "<leader>Y", '"+yy', { desc = "Copy whole line to clipboard" })

-- Paste from the clipboard
keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from cl  ipboard" })

-- Copies a line down
keymap.set("n", "<leader>cd", "yyp", { desc = "[C]opy a line [D]own" })

-- Open file explorer
keymap.set("n", "<leader>ft", vim.cmd.Ex, { desc = "Go to File Tree" })

-- Create new file in file explorer
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		-- Create a new file with 'f'
		keymap.set({ "n", "v" }, "f", function()
			vim.fn.feedkeys("%")
		end, { buffer = true, desc = "Create new file in netrw" })
	end,
})

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Indent Tabs
keymap.set("v", "<Tab>", ">gv", { desc = "Indent right in visual mode" })
keymap.set("v", "<S-Tab>", "<gv", { desc = "Indent left in visual mode" })
keymap.set("n", "<Tab>", "v><Esc>", { desc = "Indent right in normal mode" })
keymap.set("n", "<S-Tab>", "v<<Esc>", { desc = "Indent left in normal mode" })

-- Move selected lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("n", "J", ":m .+1<CR>==")
keymap.set("n", "K", ":m .-2<CR>==")

-- Better scroll
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
-- Centering search
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
-- Paste and replace
keymap.set("x", "<leader>P", [["_dP]], { desc = "[P]aste and replace text selected" })
-- Delete without copying to the paste clipboard
keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- Insert a new line below the current line in normal mode
keymap.set({ "n", "v" }, "<Enter>", "i<Enter><Esc>", { desc = "Insert new line below in normal mode" })
-- Ctrl-c to go back to normal mode
keymap.set("i", "<C-c>", "<Esc>")
-- Substitute word under cursor
keymap.set(
	"n",
	"<leader>fr",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]],
	{ desc = "[S]ubstitutue word under the cursor" }
)
-- Temux
-- keymap.set("n", "<C->", "<cmd>silent !~/scripts/tmux-sessionizer<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

keymap.set("n", "<leader>tt", require("treesj").toggle, { desc = "[T]oggle [T]reesj" })
keymap.set("n", "<leader>te", require("treesj").split, { desc = "[T]oggle [E]xpand Code Block" }) -- Expand to multiple lines
keymap.set("n", "<leader>tc", require("treesj").join, { desc = "[T]oggle [C]olapse Code Block" }) -- Colapse to single line

keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Start markdown preview" })
keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { desc = "Stop markdown preview" })

keymap.set("n", "<C-p>", vim.cmd.cprev)
keymap.set("n", "<C-n>", vim.cmd.cnext)
keymap.set("n", "<C-j>", vim.cmd.split) -- Open a new horizontal split
keymap.set("n", "<C-l>", vim.cmd.vsplit) -- Open a new vertical split
keymap.set({ "n", "v" }, "s", "", { noremap = true }) -- Disable s motion, it eliminates a character and goes to insert mode
keymap.set("n", "<C-b>", "<C-o>", { desc = "Go [B]ack" })
