return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
        term_colors = true,
        transparent_background = true,
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15 -- % of the shade applied on the inactive window
        },
        integrations = {
            cmp = true,
            gitsigns = true,
            treesitter = true,
            telescope = true,
            mason = true,
            which_key = true,
            fidget = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                unerlines = {
                    errors =  { "underline" },
                    hints =  { "underline" },
                    warnings =  { "underline" },
                    information =  { "underline" },
                },
                inlay_hints = {
                    background = true,
                },
            },
            mini = {
                enabled = true,
                indentscope_color = "",
            },
        },
    },
    config = function (_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme "catppuccin"
    end
}
