-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- paste without moving highlighted text to yank buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- to copy from vim to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- use Ctrl + c to escape from insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- remap word currently on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- remap to move to center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- remap 'a, 'b, 'c ... 'g to go to center
local str = "abcdefg"
for i = 1, #str do
  local character = str:sub(i, i)
  vim.keymap.set("n", string.format("'%s", character), string.format("'%szz", character))
end

-- move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- lsp format
vim.keymap.set({ "n", "v" }, "<leader>lf", vim.lsp.buf.format)
