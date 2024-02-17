local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer'
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
})


cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.on_attach(
	function(client,bufnr)
		local opts = {buffer= bufnr, remap = false}
		vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "<leader>rn", function () vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "K", function () vim.lsp.buf.hover() end, opts)
	end
)

lsp.setup()

