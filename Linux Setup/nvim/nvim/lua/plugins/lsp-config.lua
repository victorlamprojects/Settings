return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
				ui = {
					border = "rounded"
				}
			})
        end
    },
    -- mason lsp config (complementary plugin for mason) to automatically ensure specified lsp servers are installed
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "jdtls", "cssls" },
            })
        end
    },
    -- mason nvim dap (complementary plugin for mason) to automatically ensure debug adapters are installed
    -- note that mason lsp config will not install these for us
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug-adapter", "java-test" },
            })
        end
    },
    -- utility plugin for configuring the java language server
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- setup the lua language server
            lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

            -- setup the typescript language server
            lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

            -- setup the css language server
            lspconfig.cssls.setup({
				capabilities = capabilities,
			})

            -- Key map for showing code documentation
            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
            -- Key map to go to the definition
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode [D]efinition" })
            -- Key map to go to the declaration
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode [D]eclaration" })
            -- Key map to show code actions 
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            -- Key map to show all references 
            vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode [R]eferences" })
            -- Key map to show all implementations 
            vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[C]ode [I]mplementations" })
            -- Key map to rename code under the cursor 
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
        end
    }
}
