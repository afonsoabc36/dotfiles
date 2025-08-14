return {
  "mistricky/codesnap.nvim",
  config = function()
    local codesnap = require("codesnap")

    codesnap.setup({
      border = "rounded",
      has_breadcrumbs = true,
      bg_theme = "grape",
      watermark = "",
      save_path = "~/Pictures",
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>cc", "<cmd>CodeSnap<CR>", { desc = "Save selected code snapshot into clipboard" })
    keymap.set("n", "<leader>cs", "<cmd>CodeSnapSave<CR>", { desc = "Save selected code snapshot in ~/Pictures" })
  end,
}
