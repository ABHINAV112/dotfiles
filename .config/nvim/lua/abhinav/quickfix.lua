-- Function to add current cursor location to quickfix list and open it if not already open
local function add_to_quickfix()
    local bufnr = vim.api.nvim_get_current_buf()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local line = cursor[1]
    local col = cursor[2]
    local filename = vim.api.nvim_buf_get_name(bufnr)

    local qf_entry = {
        bufnr = bufnr,
        lnum = line,
        col = col + 1,
        text = vim.fn.getline(line),
        filename = filename,
    }

    vim.fn.setqflist({qf_entry}, 'a')

    -- Open the quickfix list if it's not already open
    if vim.fn.getwininfo(vim.fn.win_getid())[1].quickfix == 0 then
        vim.cmd('copen')
    end

    print("Added to quickfix: " .. filename .. ":" .. line .. ":" .. (col + 1))
end

-- Command to call the function
vim.api.nvim_create_user_command('AddToQuickfix', add_to_quickfix, {})
-- Optional key mapping to add current location to quickfix list
vim.api.nvim_set_keymap('n', '<leader>qf', ':AddToQuickfix<CR>', { noremap = true, silent = true })
-- Key mapping to open the quickfix list
vim.api.nvim_set_keymap('n', '<leader>qo', ':copen<CR>', { noremap = true, silent = true })


-- Function to delete the current quickfix entry
local function delete_current_quickfix_entry()
    local qf_list = vim.fn.getqflist()
    local qf_idx = vim.fn.line('.')  -- Get the current line number in the quickfix window

    if qf_idx > 0 and qf_idx <= #qf_list then
        table.remove(qf_list, qf_idx)
        vim.fn.setqflist(qf_list, 'r')  -- Replace the current quickfix list with the updated list
        print("Deleted quickfix entry at index: " .. qf_idx)
    else
        print("Invalid quickfix index: " .. qf_idx, vim.log.levels.ERROR)
    end
end

-- Command to call the delete function
vim.api.nvim_create_user_command('DeleteQFEntry', delete_current_quickfix_entry, {})

-- Key mapping to delete the current quickfix entry
vim.api.nvim_set_keymap('n', '<leader>qd', ':DeleteQFEntry<CR>', { noremap = true, silent = true })

