-- [<leader>]: mainly used to trigger plugin behavior (documented with which-keys)
vim.g.mapleader = " "

-- [<C-f>]: `indentkeys` trigger while in Insert mode
vim.g.indentkeys = "!^F"

-- [ pv]: Open netrw (file explorer)
vim.keymap.set("n", "<leader>pv", ":Ex<cr>")

-- [I]: navigate up & half-page scroll up
vim.keymap.set("", "i", "k")
vim.keymap.set("", "I", "<C-u>") -- add 'zz' after to center screen

-- [J]: navigate left & navigate to prev word
vim.keymap.set("", "j", "h")
vim.keymap.set("", "J", "b")

-- [K]: navigate down & half-page scroll down
vim.keymap.set("", "k", "j")
vim.keymap.set("", "K", "<C-d>")

-- [L]: navigate right & navigate to next word
vim.keymap.set("", "l", "l")
vim.keymap.set("", "L", "w")

-- [U]: start of line & start of file
vim.keymap.set("", "u", "^")
vim.keymap.set("", "U", "[[")

-- [O]: end of line & end of file
vim.keymap.set("", "o", "$")
vim.keymap.set("", "O", "]]")

-- [C]: copy (yank)
vim.keymap.set("", "c", "y")
vim.keymap.set("", "C", "Y")

-- [V]: paste before & after
vim.keymap.set("", "v", "p")
vim.keymap.set("", "V", "P")

-- [Q]: visual modes
vim.keymap.set("n", "q", "v")
vim.keymap.set("n", "Q", "V")
vim.keymap.set("n", "<C-q>", "<C-v>")

-- [A]: insert mode after & before
vim.keymap.set("n", "a", "a<C-f>")
vim.keymap.set("n", "A", "i")

-- [Z]: undo & redo
vim.keymap.set("", "z", "u")
vim.keymap.set("", "Z", "<C-r>")

-- [S]: substitute, substitute line word
vim.keymap.set("n", "s", "c")
vim.keymap.set("n", "S", "bdwi")

-- [D]: delete word
vim.keymap.set("n", "D", "bdw")

-- [N]: newline before & after (best paired with multipliers)
vim.keymap.set("n", "n", "o<Esc>")
vim.keymap.set("n", "N", "O<Esc>")

-- [Control + w + (I, J, K, L)]: window navigation
vim.keymap.set("n", "<C-w>i", "<C-w>k")
vim.keymap.set("n", "<C-w>j", "<C-w>h")
vim.keymap.set("n", "<C-w>k", "<C-w>j")
vim.keymap.set("n", "<C-w>l", "<C-w>l")

-- [w]: rebinding w -> aw for deleting word around cursor
vim.keymap.set("n", "w", "bw")

-- [Control + i, k]: moving selected lines up & down
vim.keymap.set("", "<A-i>", ":m '<-2<CR>gv=gv")
vim.keymap.set("", "<A-k>", ":m '>+1<CR>gv=gv")

-- [`]: Go to previous file
vim.keymap.set("n", "`", "<C-^>")
vim.keymap.set("n", "<C-left>", ":bp<CR>")
vim.keymap.set("n", "<C-right>", ":bn<CR>")

-- [Tab, Shift + Tab]: Indenting in visual mode
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- ???
vim.keymap.set("i", "<Esc>", "<Esc>")

-- [Control + /, ?]: Next/prev search candidate
vim.keymap.set("n", "<C-_>", "n")
vim.keymap.set("n", "<BS>", "N")
