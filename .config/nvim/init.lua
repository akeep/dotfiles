-- from: dotfiles/.config/nvim/lua/user/options.lua
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
-- end: dotfiles/.config/nvim/lua/user/options.lua

-- from: dotfiles/.config/nvim/lua/user/keymaps.lua
-- default options: silent & noremap.
local opts = { noremap = true, silent = true }
local copts = { noremap = true }

-- shorten function name.
local keymap = vim.api.nvim_set_keymap

-- keybindings
keymap("i", "jk", "<ESC>", opts)

keymap("n", "<leader>n", ":nohl<cr>", opts)

-- make the minibuffer behave like shell/emacs
keymap("c", "<C-a>", "<Home>", copts)
keymap("c", "<C-e>", "<End>", copts)
keymap("c", "<C-p>", "<Up>", copts)
keymap("c", "<C-n>", "<Down>", copts)
keymap("c", "<C-b>", "<Left>", copts)
keymap("c", "<C-f>", "<Right>", copts)
keymap("c", "<M-b>", "<S-Left>", copts)
keymap("c", "<M-f>", "<S-Right>", copts)
-- end: dotfiles/.config/nvim/lua/user/keymaps.lua

-- replacement for: dotfiles/.config/nvim/lua/user/plugins.nvim (and possibly after_plugins.lua)
-- setup lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Color schemes, loading a bunch for now, but will probably take one.
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  "DeviusVim/deviuspro.nvim",
  "Skullamortis/forest.nvim",
  "oxfist/night-owl.nvim",
  "neanias/everforest-nvim",
  "ofirgall/ofirkai.nvim",
  { "Everblush/nvim", name = "everblush" },
  "Mofiqul/adwaita.nvim",
  "Abstract-IDE/Abstract-cs",
  "JoosepAlviste/palenightfall.nvim",
  "tiagovla/tokyodark.nvim",
  "rmehri01/onenord.nvim",
  "olimorris/onedarkpro.nvim",
  "Mofiqul/vscode.nvim",
  "miikanissi/modus-themes.nvim",
  "zootedb0t/citruszest.nvim",
  "p00f/alabaster.nvim",
  "EdenEast/nightfox.nvim",
  "AlexvZyl/nordic.nvim",
  "craftzdog/solarized-osaka.nvim",
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", name = "catppuccin" },
  "joshdick/onedark.vim",
  { "dracula/vim", name = "dracula" },
  "NLKNguyen/papercolor-theme",
  "rebelot/kanagawa.nvim",
  { "bluz71/vim-nightfly-colors", name = "nightfly" },
  "rafamadriz/neon",
  "cpea2506/one_monokai.nvim",
  "shaeinst/roshnivim-cs",

  -- Lua line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup()
    end,
  },

  -- tree sitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local config = require("nvim-treesitter.configs")

      config.setup({
        ensure_installed = {
          "bash", "bibtex", "c", "clojure", "cmake", "cpp", "diff", "dot",
          "haskell", "html", "javascript", "json", "latex", "llvm", "lua",
          "make", "markdown", "ocaml", "python", "racket", "ruby", "rust",
          "scala", "scheme", "swift", "toml", "typescript", "vim"
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enablee = true }
      })
    end
  },

  -- Source control plugins.
  "ludovicchabant/vim-lawrencium",
  "tpope/vim-fugitive",

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-w>h", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-w>j", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-w>k", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-w>l", "<cmd>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
  },
  -- Language Server Features
  {
    "neovim/nvim-lspconfig",
    config = function()
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      
        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      local config = require('lspconfig')

      config['bashls'].setup { on_attach = on_attach }
      -- require('lspconfig')['clangd'].setup { on_attach = on_attach }
      config['clojure_lsp'].setup { on_attach = on_attach }
      config['cmake'].setup { on_attach = on_attach }
      config['elmls'].setup { on_attach = on_attach }
      config['hls'].setup { on_attach = on_attach }
      config['ocamllsp'].setup { on_attach = on_attach }
      config['pylsp'].setup { on_attach = on_attach }
      config.racket_langserver.setup {
        on_attach = on_attach,
        filetypes = { 'racket' }
      }
      config['rust_analyzer'].setup { on_attach = on_attach }
    end
  },
}, { defaults = { lazy = true }})

-- from: dotfiles/.config/nvim/lua/user/after_plugins.lua
-- Note: Some elements from this file are incorporated above

vim.opt.termguicolors = true

-- Configure some lsp options with lsp config (note: taken straight from the nvim-lspconfig page).
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- from dotfiles/.config/nvim/ftdetect/scheme.vim
vim.filetype.add({pattern = {['*.sls'] = 'scheme', ['*.sps'] = 'scheme'}})
