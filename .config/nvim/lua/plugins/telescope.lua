return {
  {
    "nvim-telescope/telescope.nvim",
    keys = function()
      return {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
        {
          "<C-p>",
          function()
            require("telescope.builtin").find_files()
          end,
          desc = "Find Git Files",
        },
        {
          "<C-f>",
          function()
            require("telescope.builtin").live_grep()
          end,
          desc = "Find Git Files",
        },
        {
          "<leader>gb",
          function()
            require("telescope.builtin").git_branches()
          end,
          desc = "switch between git branches",
        },
      }
    end,
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
