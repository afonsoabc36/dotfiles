return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    opts = {
        focus = true,
    },
    cmd = "Trouble",
    keys = {
        { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "[T]rouble Diagnostics [T]oggle" },
        { "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "[T]rouble [B]uffer Diagnostics" },
        { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "[T]rouble [S]ymbols (Trouble)" },
        {
            "<leader>tl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions/references/...",
        },
        { "<leader>tL", "<cmd>Trouble loclist toggle<cr>", desc = "Trouble [L]ocation List" },
        { "<leader>tq", "<cmd>Trouble qflist toggle<cr>", desc = "[T]rouble [Q]uickfix List" },
    },
}
