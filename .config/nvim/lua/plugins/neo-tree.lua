return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require('neo-tree').setup {}
--        vim.g.neo_treeg.emove_legacy_commands = 1
        vim.keymap.set("n", "<leader>e", "<Cmd>Neotree<CR>", { desc = "Toggle NeoTree" })

    end,
}
