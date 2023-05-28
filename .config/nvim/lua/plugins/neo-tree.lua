return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

        require('neo-tree').setup {
            close_if_last_window = true,
        }

        vim.keymap.set("n", "<leader>b", "<Cmd>NeoTreeFocusToggle<CR>", { desc = "Toggle NeoTree" })
    end,
}
