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

return require('packer_boot').startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- colorschemes
  use "cpea2506/one_monokai.nvim"

  -- Source control plugins.
  use "ludovicchabant/vim-lawrencium"
  use "tpope/vim-fugitive"

  -- Tmux helpers
  use "christoomey/vim-tmux-navigator"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
