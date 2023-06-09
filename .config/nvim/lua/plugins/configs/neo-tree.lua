vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require('neo-tree').setup {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
    default_component_configs = {
        git_status = {
            symbols = {
                -- Change type
                added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted   = "✖",-- this can only be used in the git_status source
                renamed   = "",-- this can only be used in the git_status source
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "",
                staged    = "",
                conflict  = "",
            }
        },
    },
    window = {
        position = "left",
        width = 30,
        mapping_options = {
            noremap = true,
            nowait = true,
        },
    },
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
        },
    },
}

vim.keymap.set("n", "<leader>b", "<Cmd>NeoTreeFocusToggle<CR>", { desc = "Toggle NeoTree" })
