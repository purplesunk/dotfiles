vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require('neo-tree').setup {
    close_if_last_window = true,
}

vim.keymap.set("n", "<leader>b", "<Cmd>NeoTreeFocusToggle<CR>", { desc = "Toggle NeoTree" })

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
