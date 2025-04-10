-- Conditionally load config based on vim.g.vscode
if vim.g.vscode then
  require("config.vscode")
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
end
