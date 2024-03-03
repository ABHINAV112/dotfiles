local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').setup { 
    defaults = { file_ignore_patterns = {"node_modules", "target"} },
    extensions = {
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    ["<leader>r"] = fb_actions.rename,
                    ["<leader>c"] = fb_actions.create_from_prompt,
                    ["d"] = fb_actions.remove,
                }
            },
        },
    }
}

require("telescope").load_extension "file_browser"

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})

vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gt', builtin.git_stash, {})

vim.keymap.set('n', '<leader>ts', builtin.treesitter, {})

vim.keymap.set('n', '<leader>pp', require ("telescope").extensions.file_browser.file_browser, {})

