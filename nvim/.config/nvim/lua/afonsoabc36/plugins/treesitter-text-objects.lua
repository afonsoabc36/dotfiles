return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  lazy = true,
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
      },
      move = {
        set_jumps = true,
      },
    })

    local select = require("nvim-treesitter-textobjects.select")
    local move = require("nvim-treesitter-textobjects.move")
    local swap = require("nvim-treesitter-textobjects.swap")
    local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

    -- select
    local select_maps = {
      ["a="] = { "@assignment.outer", "Select outer part of an assignment" },
      ["i="] = { "@assignment.inner", "Select inner part of an assignment" },
      ["l="] = { "@assignment.lhs", "Select left hand side of an assignment" },
      ["r="] = { "@assignment.rhs", "Select right hand side of an assignment" },
      ["aa"] = { "@parameter.outer", "Select outer part of a parameter/argument" },
      ["ia"] = { "@parameter.inner", "Select inner part of a parameter/argument" },
      ["ai"] = { "@conditional.outer", "Select outer part of a conditional" },
      ["ii"] = { "@conditional.inner", "Select inner part of a conditional" },
      ["al"] = { "@loop.outer", "Select outer part of a loop" },
      ["il"] = { "@loop.inner", "Select inner part of a loop" },
      ["af"] = { "@call.outer", "Select outer part of a function call" },
      ["if"] = { "@call.inner", "Select inner part of a function call" },
      ["aq"] = { "@quote.outer", "Select outer part of a string" },
      ["iq"] = { "@quote.inner", "Select inner part of a string" },
      ["am"] = { "@function.outer", "Select outer part of a method/function definition" },
      ["im"] = { "@function.inner", "Select inner part of a method/function definition" },
      ["ac"] = { "@class.outer", "Select outer part of a class" },
      ["ic"] = { "@class.inner", "Select inner part of a class" },
    }
    for key, val in pairs(select_maps) do
      local query = val[1]
      vim.keymap.set({ "x", "o" }, key, function()
        select.select_textobject(query, "textobjects")
      end, { desc = val[2] })
    end

    -- swap
    local swap_next_maps = {
      ["<leader>na"] = { "@parameter.inner", "Swap parameter with next" },
      ["<leader>n:"] = { "@property.outer", "Swap object property with next" },
      ["<leader>nm"] = { "@function.outer", "Swap function with next" },
    }
    local swap_prev_maps = {
      ["<leader>pa"] = { "@parameter.inner", "Swap parameter with prev" },
      ["<leader>p:"] = { "@property.outer", "Swap object property with prev" },
      ["<leader>pm"] = { "@function.outer", "Swap function with prev" },
    }
    for key, val in pairs(swap_next_maps) do
      local query = val[1]
      vim.keymap.set("n", key, function()
        swap.swap_next(query)
      end, { desc = val[2] })
    end
    for key, val in pairs(swap_prev_maps) do
      local query = val[1]
      vim.keymap.set("n", key, function()
        swap.swap_previous(query)
      end, { desc = val[2] })
    end

    -- move
    local goto_next_start_maps = {
      ["]f"] = { "@call.outer", "Next function call start" },
      ["]m"] = { "@function.outer", "Next method/function def start" },
      ["]c"] = { "@class.outer", "Next class start" },
      ["]i"] = { "@conditional.outer", "Next conditional start" },
      ["]l"] = { "@loop.outer", "Next loop start" },
    }
    local goto_next_end_maps = {
      ["]F"] = { "@call.outer", "Next function call end" },
      ["]M"] = { "@function.outer", "Next method/function def end" },
      ["]C"] = { "@class.outer", "Next class end" },
      ["]I"] = { "@conditional.outer", "Next conditional end" },
      ["]L"] = { "@loop.outer", "Next loop end" },
    }
    local goto_prev_start_maps = {
      ["[f"] = { "@call.outer", "Prev function call start" },
      ["[m"] = { "@function.outer", "Prev method/function def start" },
      ["[c"] = { "@class.outer", "Prev class start" },
      ["[i"] = { "@conditional.outer", "Prev conditional start" },
      ["[l"] = { "@loop.outer", "Prev loop start" },
    }
    local goto_prev_end_maps = {
      ["[F"] = { "@call.outer", "Prev function call end" },
      ["[M"] = { "@function.outer", "Prev method/function def end" },
      ["[C"] = { "@class.outer", "Prev class end" },
      ["[I"] = { "@conditional.outer", "Prev conditional end" },
      ["[L"] = { "@loop.outer", "Prev loop end" },
    }
    for key, val in pairs(goto_next_start_maps) do
      local query = val[1]
      vim.keymap.set({ "n", "x", "o" }, key, function()
        move.goto_next_start(query, "textobjects")
      end, { desc = val[2] })
    end
    for key, val in pairs(goto_next_end_maps) do
      local query = val[1]
      vim.keymap.set({ "n", "x", "o" }, key, function()
        move.goto_next_end(query, "textobjects")
      end, { desc = val[2] })
    end
    for key, val in pairs(goto_prev_start_maps) do
      local query = val[1]
      vim.keymap.set({ "n", "x", "o" }, key, function()
        move.goto_previous_start(query, "textobjects")
      end, { desc = val[2] })
    end
    for key, val in pairs(goto_prev_end_maps) do
      local query = val[1]
      vim.keymap.set({ "n", "x", "o" }, key, function()
        move.goto_previous_end(query, "textobjects")
      end, { desc = val[2] })
    end

    -- scope/fold special moves
    vim.keymap.set({ "n", "x", "o" }, "]s", function()
      move.goto_next_start("@scope", "locals")
    end, { desc = "Next scope" })
    vim.keymap.set({ "n", "x", "o" }, "]z", function()
      move.goto_next_start("@fold", "folds")
    end, { desc = "Next fold" })

    -- repeat moves
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
  end,
}
