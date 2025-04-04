return { -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        require("telescope").setup({
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
        local keymap = vim.keymap
        keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
        keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
        keymap.set("n", "<leader>fg", builtin.git_files, { desc = "[F]ind [G]it Files" })
        keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
        keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
        keymap.set("n", "<leader>fs", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "[F]ind [S]tring occurences" })
        keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
        -- keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
        keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ld Recent Files" })
        keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing [B]uffers" })
        keymap.set("n", "<leader>fT", "<cmd>TodoTelescope<cr>", { desc = "[F]ind [T]odo comments" })

        keymap.set("n", "<leader>/", function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "[/] Fuzzily search in current buffer" })

        keymap.set("n", "<leader>s/", function()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files",
            })
        end, { desc = "[S]earch [/] in Open Files" })

        -- Shortcut for searching your Neovim configuration files
        keymap.set("n", "<leader>sn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[S]earch [N]eovim files" })
    end,
}
