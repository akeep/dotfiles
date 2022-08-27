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
