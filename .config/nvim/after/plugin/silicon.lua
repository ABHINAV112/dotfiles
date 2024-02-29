require('silicon').setup({
	font = "Arial",
    pad_horiz = 20,
	pad_vert = 20,
    shadow_blur_radius = 8,
})

vim.api.nvim_set_keymap('v', '<leader>sc', ':Silicon<CR>', { noremap = true, silent = true })

