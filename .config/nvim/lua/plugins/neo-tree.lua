return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden files by default
        hide_dotfiles = false, -- Do not hide dotfiles (files beginning with .)
        hide_gitignored = false, -- Do not hide gitignored files
      },
    },
  },
  keys = {
    {
      "<leader>nt",
      function()
        vim.cmd("Neotree toggle")
      end,
    },
  },
}
