return {
  "sylvanfranklin/omni-preview.nvim",
  dependencies = {
    { "toppair/peek.nvim", lazy = true, build = "deno task --quiet build:fast" }, -- markdown
    { "chomosuke/typst-preview.nvim", lazy = true }, -- typst
    { "hat0uma/csvview.nvim", lazy = true }, -- csv
  },
  config = function()
    require("omni-preview").setup()
    require("typst-preview").setup({
      dependencies_bin = {
        ["tinymist"] = nil,
        ["websocat"] = nil,
      },
    })

    require("peek").setup({ app = "browser" })
    require("csvview").setup({
      view = {
        sticky_header = "true",
        display_mode = "border",
        header_lnum = "1",
      },
    })
    vim.keymap.set("n", "<leader>op", ":OmniPreview start<CR>", { silent = true })
    vim.keymap.set("n", "<leader>oo", ":OmniPreview stop<CR>", { silent = true })
  end,
}
