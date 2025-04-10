-- VSCode Neovim Integration Configuration

-- Helper functions for keymaps
local function nv_keymap(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', lhs, rhs, { noremap = true, silent = true })
end

local function nx_keymap(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, { silent = true })
  vim.api.nvim_set_keymap('v', lhs, rhs, { silent = true })
end

-- Basic navigation functions and keymaps
vim.g.mapleader = " "

nv_keymap('s', '}')
nv_keymap('S', '{')
nv_keymap('<leader>h', '^')
nv_keymap('<leader>l', '$')
nv_keymap('<leader>a', '%')
nx_keymap('j', 'gj')
nx_keymap('k', 'gk')

-- Comment functions and keymaps
local comment = {
  selected = function()
    vim.fn.VSCodeNotifyRange("editor.action.commentLine", vim.fn.line("v"), vim.fn.line("."), 1)
  end
}
vim.keymap.set({ 'n', 'v' }, "<leader>gc", comment.selected)

-- Editor functions and keymaps
local editor = {
  closeActive = function()
    vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
  end,
  closeOther = function()
    vim.fn.VSCodeNotify("workbench.action.closeOtherEditors")
  end,
  organizeImport = function()
    vim.fn.VSCodeNotify("editor.action.organizeImports")
  end
}
vim.keymap.set({ 'n' }, "<leader>i", editor.organizeImport)
vim.keymap.set({ 'n' }, "<leader>n", "<cmd>noh<cr>")

-- Workbench functions and keymaps
local workbench = {
  showCommands = function()
    vim.fn.VSCodeNotify("workbench.action.showCommands")
  end,
  previousEditor = function()
    vim.fn.VSCodeNotify("workbench.action.previousEditor")
  end,
  nextEditor = function()
    vim.fn.VSCodeNotify("workbench.action.nextEditor")
  end
}
vim.keymap.set({ 'n', 'v' }, "<leader> ", workbench.showCommands)
vim.keymap.set({ 'n', 'v' }, "H", workbench.previousEditor)
vim.keymap.set({ 'n', 'v' }, "L", workbench.nextEditor)

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
  switch = function()
    vim.fn.VSCodeNotify("workbench.action.openRecent")
  end,
  tree = function()
    vim.fn.VSCodeNotify("workbench.view.explorer")
  end
}
vim.keymap.set({ 'n' }, "<leader>pf", project.findFile)
vim.keymap.set({ 'n' }, "<C-space>s", project.switch)
vim.keymap.set({ 'n' }, "<leader>pt", project.tree)

-- File functions and keymaps
local file = {
  new = function()
    vim.fn.VSCodeNotify("workbench.explorer.fileView.focus")
    vim.fn.VSCodeNotify("explorer.newFile")
  end,
  save = function()
    vim.fn.VSCodeNotify("workbench.action.files.save")
  end,
  saveAll = function()
    vim.fn.VSCodeNotify("workbench.action.files.saveAll")
  end,
  format = function()
    vim.fn.VSCodeNotify("editor.action.formatDocument")
  end,
  showInExplorer = function()
    vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
  end,
  rename = function()
    vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
    vim.fn.VSCodeNotify("renameFile")
  end
}
vim.keymap.set({ 'n' }, "<space>lf", file.format)
vim.keymap.set({ 'n' }, "<space>fn", file.new)
vim.keymap.set({ 'n' }, "<space>ft", file.showInExplorer)
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
vim.keymap.set({ 'n' }, "<leader>rr", symbol.rename)
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

-- VSCode functions and keymaps
local vscode = {
  focusEditor = function()
    vim.fn.VSCodeNotify("workbench.action.focusActiveEditorGroup")
  end,
  moveSideBarRight = function()
    vim.fn.VSCodeNotify("workbench.action.moveSideBarRight")
  end,
  moveSideBarLeft = function()
    vim.fn.VSCodeNotify("workbench.action.moveSideBarLeft")
  end
}
vim.keymap.set({ 'n' }, "<leader>ve", vscode.focusEditor)
vim.keymap.set({ 'n' }, "<leader>vl", vscode.moveSideBarLeft)
vim.keymap.set({ 'n' }, "<leader>vr", vscode.moveSideBarRight)
