return {
  "ramboe/ramboe-dotnet-utils",
  dependencies = { "mfussenegger/nvim-dap" },
  opts = {
    fzflua_razor_outline_preview_context = 5,
    fzflua_razor_outline_preview_window = "up:60%",
    fzflua_razor_outline_prompt = "Razor> ",
  },
  config = function(_, opts)
    require("fzf-lua-pickers-razor-outline").setup(opts)
  end,
}
