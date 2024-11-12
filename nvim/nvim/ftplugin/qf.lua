-- to make the quickfix window close automatically after choosing an item
-- (quickfix opens e.g. when a languages server returns multiple definitions when issuing a goto definition)
vim.api.nvim_set_keymap('n', '<CR>', '<CR><Cmd>cclose<CR>', {})
