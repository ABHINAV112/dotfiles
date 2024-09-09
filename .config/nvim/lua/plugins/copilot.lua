return {
  {
    "github/copilot.vim",
    config = function()
      -- Disable default tab mapping for Copilot
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

      -- Set filetypes where Copilot should be enabled or disabled
      vim.g.copilot_filetypes = {
        ["*"] = true,
      }
    end,
  },
}
