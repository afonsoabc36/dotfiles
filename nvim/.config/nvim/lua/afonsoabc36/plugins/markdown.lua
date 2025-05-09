return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  init = function()
    -- TokyoNight colorscheme
    local colors = {
      bg_dark = "#1a1b26",
      bg = "#1f2335",
      bg_highlight = "#292e42",
      fg = "#c0caf5",
      cyan = "#7dcfff",
      blue = "#7aa2f7",
      purple = "#bb9af7",
      green = "#9ece6a",
      orange = "#ff9e64",
      red = "#f7768e",
      yellow = "#e0af68",
      comment = "#565f89",
    }

    local inline_bg = colors.bg_highlight
    local inline_fg = colors.cyan

    if vim.g.md_heading_bg == "transparent" then
      vim.cmd(string.format([[highlight Headline1Bg guibg=%s guifg=%s]], colors.blue, colors.bg))
      vim.cmd(string.format([[highlight Headline2Bg guibg=%s guifg=%s]], colors.green, colors.bg))
      vim.cmd(string.format([[highlight Headline3Bg guibg=%s guifg=%s]], colors.yellow, colors.bg))
      vim.cmd(string.format([[highlight Headline4Bg guibg=%s guifg=%s]], colors.orange, colors.bg))
      vim.cmd(string.format([[highlight Headline5Bg guibg=%s guifg=%s]], colors.red, colors.bg))
      vim.cmd(string.format([[highlight Headline6Bg guibg=%s guifg=%s]], colors.purple, colors.bg))

      vim.cmd(string.format([[highlight Headline1Fg cterm=bold gui=bold guifg=%s]], colors.blue))
      vim.cmd(string.format([[highlight Headline2Fg cterm=bold gui=bold guifg=%s]], colors.green))
      vim.cmd(string.format([[highlight Headline3Fg cterm=bold gui=bold guifg=%s]], colors.yellow))
      vim.cmd(string.format([[highlight Headline4Fg cterm=bold gui=bold guifg=%s]], colors.orange))
      vim.cmd(string.format([[highlight Headline5Fg cterm=bold gui=bold guifg=%s]], colors.red))
      vim.cmd(string.format([[highlight Headline6Fg cterm=bold gui=bold guifg=%s]], colors.purple))
    else
      vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s]], colors.bg, colors.blue))
      vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s]], colors.bg, colors.green))
      vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s]], colors.bg, colors.yellow))
      vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s]], colors.bg, colors.orange))
      vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s]], colors.bg, colors.red))
      vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s]], colors.bg, colors.purple))
    end

    vim.cmd(string.format([[highlight RenderMarkdownCodeInline guifg=%s guibg=%s]], inline_fg, inline_bg))
  end,
  opts = {
    bullet = {
      enabled = true,
    },
    checkbox = {
      enabled = true,
      position = "inline",
      unchecked = {
        highlight = "RenderMarkdownUnchecked",
        scope_highlight = nil,
      },
      checked = {
        highlight = "RenderMarkdownChecked",
        scope_highlight = nil,
      },
    },
    html = {
      enabled = true,
      comment = {
        conceal = false,
      },
    },
    link = {
      image = vim.g.neovim_mode == "skitty" and "" or "󰥶 ",
      custom = {
        youtu = { pattern = "youtu%.be", icon = "󰗃 " },
      },
    },
    heading = {
      sign = false,
      icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
      backgrounds = {
        "Headline1Bg",
        "Headline2Bg",
        "Headline3Bg",
        "Headline4Bg",
        "Headline5Bg",
        "Headline6Bg",
      },
      foregrounds = {
        "Headline1Fg",
        "Headline2Fg",
        "Headline3Fg",
        "Headline4Fg",
        "Headline5Fg",
        "Headline6Fg",
      },
    },
    render_modes = { "n", "c", "t" },
  },
}
