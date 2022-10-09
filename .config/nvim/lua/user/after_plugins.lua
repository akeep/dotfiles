-- select a colorscheme
local status_ok, one_monokai = pcall(require, "one_monokai")
if status_ok then
  one_monokai.setup()
else
  print("Unable to load one_monokai colorscheme.")
end
vim.opt.termguicolors = true

-- Configure Scala Metals' nvim-metals plugin.
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach({})
  end,
  group = nvim_metals_group,
})

