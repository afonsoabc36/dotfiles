return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local mode = {
      "mode",
      fmt = function(str)
        return " " .. str .. " "
      end,
    }

    local branch = { "branch", icons_enabled = true, icon = "" }

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
      symbols = { added = " ", modified = " ", removed = " " },
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
        --        
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "neo-tree" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { filename },
        lualine_d = {
          { -- Not working
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          },
        },
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
}
