return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})

            vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {desc="[G]it Preview [H]unk"})
        end
    },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", ":Git<cr>", {desc = "[G]it [S]tatus"})
            vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", {desc="[G]it [B]lame"})
            vim.keymap.set("n", "<leader>gA", ":Git add .<cr>", {desc = "[G]it Add [A]ll"})
            vim.keymap.set("n", "<leader>ga", ":Git add<cr>", {desc = "[G]it [A]dd"})
            vim.keymap.set("n", "<leader>gc", ":Git commit<cr>", {desc = "[G]it [C]ommit"})
            vim.keymap.set("n", "<leader>gP", ":Git push<cr>", {desc = "[G]it [P]ush"})
            vim.keymap.set("n", "<leader>gl", ":Git log<cr>", {desc = "[G]it [L]og"})
            vim.keymap.set("n", "<leader>gd", ":Git diff<cr>", {desc = "[G]it [D]iff"})
        end
    }
}
