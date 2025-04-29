-- Set debug logging off by default
vim.g.vscode_debug_log = false

-- Debug logging function
local function log(message)
  if vim.g.vscode_debug_log then
    print("[VSCode Neovim Debug]: " .. tostring(message))
  end
end


-- Basic navigation functions and keymaps
vim.g.mapleader = " "

-- Comment functions and keymaps
local comment = {
  selected = function()
    vim.fn.VSCodeNotifyRange("editor.action.commentLine", vim.fn.line("v"), vim.fn.line("."), 1)
  end
} vim.keymap.set({ 'n', 'v' }, "<leader>gc", comment.selected)

-- Workbench functions and keymaps
local workbench = {
  showCommands = function()
    vim.fn.VSCodeNotify("workbench.action.showCommands")
  end
}
vim.keymap.set({ 'n', 'v' }, "<leader> ", workbench.showCommands)

-- Git functions and keymaps
local git = {
  status = function()
    vim.fn.VSCodeNotify("workbench.view.scm")
  end,
  switch = function()
    vim.fn.VSCodeNotify("git.checkout")
  end,
  push = function()
    vim.fn.VSCodeNotify("git.push")
  end,
  pull = function()
    vim.fn.VSCodeNotify("git.pull")
  end,
  fetch = function()
    vim.fn.VSCodeNotify("git.fetch")
  end,
  commit = function()
    vim.fn.VSCodeNotify("git.commit")
  end
}
vim.keymap.set({ 'n' }, "<leader>gb", git.switch)
vim.keymap.set({ 'n' }, "<leader>gf", git.fetch)
vim.keymap.set({ 'n' }, "<leader>gs", git.status)
vim.keymap.set({ 'n' }, "<leader>gp", git.pull)

-- Project functions and keymaps
local project = {
  findFile = function()
    vim.fn.VSCodeNotify("workbench.action.quickOpen")
  end,
  tree = function()
    vim.fn.VSCodeNotify("workbench.view.explorer")
  end
}
vim.keymap.set({ 'n' }, "<leader>pf", project.findFile)
vim.keymap.set({ 'n' }, "<leader>pt", project.tree)

-- File functions and keymaps
local file = {
  format = function()
    vim.fn.VSCodeNotify("editor.action.formatDocument")
  end,
  rename = function()
    vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
    vim.fn.VSCodeNotify("renameFile")
  end
}
vim.keymap.set({ 'n' }, "<space>lf", file.format)
vim.keymap.set({ 'n' }, "<space>fr", file.rename)

-- Toggle functions and keymaps
local toggle = {
  toggleSideBarVisibility = function()
    vim.fn.VSCodeNotify("workbench.action.toggleSidebarVisibility")
  end
}
vim.keymap.set({ 'n', 'v' }, "<leader>nt", toggle.toggleSideBarVisibility)

-- Refactor functions and keymaps
local refactor = {
  showMenu = function()
    vim.fn.VSCodeNotify("editor.action.refactor")
  end
}
local symbol = {
  rename = function()
    vim.fn.VSCodeNotify("editor.action.rename")
  end
}
vim.keymap.set({ 'v' }, "<leader>r", refactor.showMenu)
vim.keymap.set({ 'n' }, "<leader>rn", symbol.rename)
vim.api.nvim_set_keymap('n', '<leader>rd', 'V%d', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>rv', 'V%', { silent = true })

-- Search functions and keymaps
local search = {
  reference = function()
    vim.fn.VSCodeNotify("editor.action.referenceSearch.trigger")
  end,
  referenceInSideBar = function()
    vim.fn.VSCodeNotify("references-view.find")
  end,
  project = function()
    vim.fn.VSCodeNotify("editor.action.addSelectionToNextFindMatch")
    vim.fn.VSCodeNotify("workbench.action.findInFiles")
  end,
  text = function()
    vim.fn.VSCodeNotify("workbench.action.findInFiles")
  end
}
vim.keymap.set({ 'n' }, "<leader>sr", search.reference)
vim.keymap.set({ 'n' }, "<leader>sR", search.referenceInSideBar)
vim.keymap.set({ 'n' }, "<leader>sp", search.project)
vim.keymap.set({ 'n' }, "<leader>st", search.text)



-- Window navigation functions and keymaps
local window = {
  moveLeft = function()
    vim.fn.VSCodeNotify("workbench.action.navigateLeft")
  end,
  moveDown = function()
    vim.fn.VSCodeNotify("workbench.action.navigateDown")
  end,
  moveUp = function()
    vim.fn.VSCodeNotify("workbench.action.navigateUp")
  end,
  moveRight = function()
    vim.fn.VSCodeNotify("workbench.action.navigateRight")
  end
}

vim.keymap.set({ 'n' }, "<C-h>", window.moveLeft)
vim.keymap.set({ 'n' }, "<C-j>", window.moveDown)
vim.keymap.set({ 'n' }, "<C-k>", window.moveUp)
vim.keymap.set({ 'n' }, "<C-l>", window.moveRight)


-- Scroll functions and keymaps
local function centerLine()
  local current_line = vim.fn.line('.')
  vim.fn.VSCodeNotify("revealLine", { lineNumber = current_line, at = "center" })
end

local function halfPage(direction)
  local current_line = vim.fn.line('.')
  local window_height = vim.fn.winheight(0)
  local half_height = math.floor(window_height / 2)
  local target_line = current_line + (direction.value * half_height)
  vim.cmd("normal! " .. half_height .. direction.key)
  centerLine()
end

local scroll = {
  directions = {
    up = { value = -1, key = "gk" },
    down = { value = 1, key = "gj" }
  },
  halfPage = halfPage,
  centerLine = centerLine
}

scroll.halfPageDown = function() return scroll.halfPage(scroll.directions.down) end
scroll.halfPageUp = function() return scroll.halfPage(scroll.directions.up) end

vim.keymap.set({ 'n', 'v' }, "<C-d>", scroll.halfPageDown)
vim.keymap.set({ 'n', 'v' }, "<C-u>", scroll.halfPageUp)

vim.keymap.set('n', 'n', function()
  pcall(vim.cmd, "normal! n")
  centerLine()
  log("Moved to next occurrence")
end, { noremap = true, silent = true })

vim.keymap.set({ 'n', 'v' }, 'G', function()
  vim.cmd("normal! G")
  centerLine()
  log("Moved to the bottom of the file")
end, { noremap = true, silent = true })

-- to copy from vim to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- move lines up and down silently
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.clipboard = ""

-- avoid highlighting search terms
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- long undodir
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.g.lazyvim_check_order = false

-- Add this function to close the editors in the current group
local function closeCurrentGroupEditors()
  log("Attempting to close current group editors")
  vim.fn.VSCodeNotify("workbench.action.closeEditorsInGroup")
  log("Close command sent")
end

-- Override the :q command to use the new function
vim.keymap.set({ 'n', 'v' }, "<leader>q", closeCurrentGroupEditors)