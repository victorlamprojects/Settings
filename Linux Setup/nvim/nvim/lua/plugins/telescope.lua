return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim", -- general purpose plugin for building user interfaces in neovim plugins
        },
        config = function()
            -- get access to telescope built in functions
            local builtin = require("telescope.builtin")

            -- Key map to search file
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles"})
            -- Key map to search file content
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep"})
            -- Key map to search for code diagnostics 
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics"})
            -- Key map to resume to the previous search
            vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume"})
            -- Key map to search for Recent Files 
            vim.keymap.set("n", "<leader>f", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
            -- Key map to search for Open Buffers 
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = '[F]ind Existing [B]uffers' })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            local actions = require("telescope.actions")

            require("telescope").setup({
                -- use ui-select dropdown
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                },
                -- set keymappings to navigate through items in the telescope io
                mappings = {
                    i = {
                        -- use ctrl-n to go to the next option
                        ["<C-n>"] = actions.cycle_history_next,
                        -- use ctrl-p to go to the previous option
                        ["<C-p>"] = actions.cycle_history_prev,
                        -- use ctrl-j to go to the next preview
                        ["<C-j>"] = actions.move_selection_next,
                        -- use ctrl-k to go to the previous preview
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                },
                require("telescope").load_extension("ui-select")
            })
        end
    }
}
