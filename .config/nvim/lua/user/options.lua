-- indentation options
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- syntax options
vim.opt.showmatch = true

-- wrapping options
vim.opt.wrap = false

-- wildmode options
vim.opt.wildmode = { "list:longest", "full" }

-- mouse option
vim.opt.mouse = "nv"

-- clipboard options
vim.opt.clipboard:append "unnamedplus"

-- select a colorscheme
local status_ok, one_monokai = pcall(require, "one_monokai")
if status_ok then
  one_monokai.setup()
else
  print("Unable to load one_monokai colorscheme.")
end
vim.opt.termguicolors = true
