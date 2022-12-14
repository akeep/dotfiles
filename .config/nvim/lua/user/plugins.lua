-- start-up packer with a little protection to avoid raising error on failures.
local status_ok, packer = pcall(require, "packer_boot")
if not status_ok then
  print("Packer load failed!")
  return
end

-- initialize packer to use a floating window.
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  }
}

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return require('packer_boot').startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- colorschemes
  use "shaeinst/roshnivim-cs"
  use "cpea2506/one_monokai.nvim"
  use "rafamadriz/neon"

  -- add the fancies
  use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use 'nvim-treesitter/nvim-treesitter'

  -- Source control plugins.
  use "ludovicchabant/vim-lawrencium"
  use "tpope/vim-fugitive"

  -- Tmux helpers
  use "christoomey/vim-tmux-navigator"

  -- Language Server Features
  use 'neovim/nvim-lspconfig'
  use {'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
