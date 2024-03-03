require("neo-tree").setup({
  close_if_last_window = true,
  enable_diagnostics = true,
  enable_git_status = true,
  popup_border_style = "rounded",
  sort_case_insensitive = false,
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
  window = { width = 30 },
})

-- Toggle Neo-tree visibility
vim.api.nvim_set_keymap('n', '<leader>nt', ':Neotree toggle<CR>', {noremap = true, silent = true})

