return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        -- ts-autotag utilizes treesitter to automatically close tsx tags
        "windwp/nvim-ts-autotag"
    },
    build = ":TSUpdate", -- run the TSUpdate command to ensure all servers are installed and updated
    config = function()
        local ts_config = require("nvim-treesitter.configs")

        ts_config.setup({
            -- make sure the following servers are installed
            ensure_installed = { "vim", "vimdoc", "lua", "java", "javascript", "typescript", "html", "css", "json", "tsx", "markdown", "markdown_inline", "gitignore" },
            -- make sure highlighting is enabled
            highlight = { enable = true },
            -- enable tsx auto closing tag creation
            autotag = {
                enable = true
            }
        })
    end
}
