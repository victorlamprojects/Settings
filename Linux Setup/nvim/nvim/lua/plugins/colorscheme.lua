return {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true,
    }
    config = function ()
        vim.cmd.colorscheme "catppuccin"
    end
}
