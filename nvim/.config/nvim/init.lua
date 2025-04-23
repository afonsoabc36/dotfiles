require("afonsoabc36.core")
require("afonsoabc36.lazy")
require("afonsoabc36.typst")

local local_config = vim.fn.getcwd() .. "/.nvim.lua"
if vim.fn.filereadable(local_config) == 1 then
  local ok, err = pcall(dofile, local_config)
  if not ok then
    vim.notify("[.nvim.lua] error: " .. err, vim.log.levels.ERROR)
  end
end
