# NVim Setup
## File Structure (https://learnvimscriptthehardway.stevelosh.com/chapters/42.html)
```
$HOME/.config
└───nvim
    └───init.lua        	# Root configuration using lua
    └───lua   				# lua setup
        └───config      	# lazyvim config
		│   ├── jdtls.lua 	# jdtls config
        │   ├── options.lua	# vim configs
		│   └── keymaps.lua	# Key mappings
        └───plugins     	# Plugins
```

## 0. Install NVIM (https://github.com/neovim/neovim/releases)
```
cd ~/Downloads
sudo mkdir /opt/nvim-linux64
tar -zvxf nvim-linux64.tar.gz
sudo mv ./nvim-linux64 /opt/nvim-linux64
```
Add the following to ~/.bashrc or ~/.zshrc
```
export PATH="$PATH:/opt/nvim-linux64/bin"
```
Setup nvim config directory
```
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua/config
mkdir -p ~/.config/nvim/lua/plugins
```

## 1. vim config setup ``~/.config/nvim/lua/config/options.lua```
```
-- Left column and similar settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.wrap = false 
vim.opt.scrolloff = 10 
vim.opt.sidescrolloff = 8 

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Tab
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.breakindent = true

-- File
vim.opt.fileencoding = "utf-8"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false 
vim.opt.foldmethod = "marker"
vim.opt.wildignore = {".git, */dist*/*,*/target/*,*/builds/*,*/node_modules/*"}

-- General Behavior
vim.opt.cursorline = true
vim.opt.timeoutlen = 1000
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard = "unnamedplus" -- enable system clipboard access
vim.opt.conceallevel = 0 -- show concealed characters in markdown files
vim.opt.splitbelow = true -- force horizontal splits below current window
vim.opt.splitright = true -- force vertical splits below current window
vim.opt.termguicolors = true -- enable term GUI colors
vim.opt.undofile = true -- enable persistent undo

-- netrw setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
```

## 2. Key maps setup ```~/.config/nvim/lua/config/keymaps.lua```
```
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>h", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<leader>l", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<leader>j", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<leader>k", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<leader>q", ":q<cr>", { desc = "Move focus to the upper window" })

-- Split Windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "[W]indow Split [H]ertical" })

-- Stay in visual mode after indented -> allow multiple indents at the same time
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })
```

## 3. Initialization script setup ```~/.config/nvim/init.lua```
```
-- The path where lazy will clone plugin code
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Check to see if lazy itself has been cloned, if not clone it int the lazy.nvim directory
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath 
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
-- Add the path to the lazy plugin repositories to the vim runtime path
vim.opt.rtp:prepend(lazypath)

-- Declare a few options for lazy
local opts = {
    change_detection = {
        notify = false
    },
    checker = {
        -- automatically check for plugin updates
        enabled = true, -- check for plugin updates periodically
        notify = false,
    },
}

-- Load configuration from lua/config/
require("config.options")
require("config.keymaps")
require("config.autocmds")

require("lazy").setup("plugins", opts)
```

## 4. Plugins 
### colorscheme setup ```~/.config/nvim/lua/plugins/colorscheme.lua```
```
return {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function ()
        vim.cmd.colorscheme "catppuccin"
    end
}
```
### nvim-tree setup ```~/.config/nvim/lua/plugins/nvim-tree.lua```
```
return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle [E]xplorer" })
        require("nvim-tree").setup({
            hijack_netrw = true,
            auto_reload_on_write = true,
        })
    end
}
```
### telescope setup ```~/.config/nvim/lua/plugins/telescope.lua```
```
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
```
To enable the ripgrep feature, you need to install ripgrep:
```
sudo apt-get install ripgrep
```
### treesitter setup ```~/.config/nvim/lua/plugins/treesitter.lua```
```
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
```
### cmp setup ```~/.config/nvim/lua/plugins/cmp.lua```
```
return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            -- feed luasnip suggestions to cmp
            "saadparwaiz1/cmp_luasnip",
            -- provide vscode like snippets to cmp
            "rafamadriz/friendly-snippets",
        }
    },
    -- cmp-nvim-lsp provides language specific completion suggestions to nvim-cmp
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    -- nvim-cmp provides auto completion and auto completion dropdown ui
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- buffer based completion options
            "hrsh7th/cmp-buffer",
            -- path based completion options
            "hrsh7th/cmp-path",
        },
        config = function()
            -- Gain access to the functions of the cmp plugin
            local cmp = require("cmp")
            -- Gain access to the function of the luasnip plugin
            local luasnip = require("luasnip")

            -- Lazily load the vscode like snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- All the cmp setup function to configure our completion experience
            cmp.setup({
                -- How should completion options be displayed to us?
                completion = {
                    -- menu: display options in a menu
                    -- menuone: automatically select the first option of the menu
                    -- preview: automatically display the completion candiate as you navigate the menu
                    -- noselect: prevent neovim from automatically selecting a completion option while navigating the menu
                    competeopt = "menu,menuone,preview,noselect"
                },
                -- setup snippet support based on the active lsp and the current text of the file
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                -- setup how we interact with completion menus and options
                mapping = cmp.mapping.preset.insert({
                     -- previous suggestion
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    -- next suggestion
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    -- show completion suggestions
                    ["<C-Space"] = cmp.mapping.complete(),
                    -- close completion window
                    ["<C-e>"] = cmp.mapping.abort(),
                    -- confirm completion, only when you explicitly selected an option
                    ["<CR>"] = cmp.mapping.confirm({ select = false})
                }),
                -- Where and how should cmp rank and find completions
                -- Order matters, cmp will provide lsp suggestions above all else
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' }
                })
            })
        end
    }
}
```

### LSP setup ```~/.config/nvim/lua/plugins/lsp-config.lua```
```
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    -- mason lsp config (complementary plugin for mason) to automatically ensure specified lsp servers are installed
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "jdtls" },
            })
        end
    },
    -- mason nvim dap (complementary plugin for mason) to automatically ensure debug adapters are installed
    -- note that mason lsp config will not install these for us
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug-adapter", "java-test" }
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

            -- setup the lua language server
            lspconfig.lua_ls.setup({})

            -- setup the typescript language server
            lspconfig.ts_ls.setup({})

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
```
Install the following servers manually if not working
```
:Mason
ctrl-f
java
```
- oogle-java-format
- java-test
- java-debug-adapter

## 5. Setup jdtls (following https://github.com/unknownkoder/Java-FullStack-NeoVim-Configuration/blob/main/lua/config/jdtls.lua)
```~/.config/nvim/lua/config/jdtls.lua```
(Note change the workspace_path variable to the place where your projects are sitting in)
```
local function get_jdtls()
    -- Get the Mason Registry to gain access to downloaded binaries
    local mason_registry = require("mason-registry")
    -- Find the JDTLS package in the Mason Regsitry
    local jdtls = mason_registry.get_package("jdtls")
    -- Find the full path to the directory where Mason has downloaded the JDTLS binaries
    local jdtls_path = jdtls:get_install_path()
    -- Obtain the path to the jar which runs the language server
    local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
     -- Declare white operating system we are using, windows use win, macos use mac
    local SYSTEM = "linux"
    -- Obtain the path to configuration files for your specific operating system
    local config = jdtls_path .. "/config_" .. SYSTEM
    -- Obtain the path to the Lomboc jar
    local lombok = jdtls_path .. "/lombok.jar"
    return launcher, config, lombok
end

local function get_bundles()
    -- Get the Mason Registry to gain access to downloaded binaries
    local mason_registry = require("mason-registry")
    -- Find the Java Debug Adapter package in the Mason Registry
    local java_debug = mason_registry.get_package("java-debug-adapter")
    -- Obtain the full path to the directory where Mason has downloaded the Java Debug Adapter binaries
    local java_debug_path = java_debug:get_install_path()

    local bundles = {
        vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", 1)
    }

    -- Find the Java Test package in the Mason Registry
    local java_test = mason_registry.get_package("java-test")
    -- Obtain the full path to the directory where Mason has downloaded the Java Test binaries
    local java_test_path = java_test:get_install_path()
    -- Add all of the Jars for running tests in debug mode to the bundles list
    vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar", 1), "\n"))

    return bundles
end

local function get_workspace()
    -- Get the home directory of your operating system
    local home = os.getenv "HOME"
    -- Declare a directory where you would like to store project information
    local workspace_path = home .. "/Projects/"
    -- Determine the project name
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    -- Create the workspace directory by concatenating the designated workspace path and the project name
    local workspace_dir = workspace_path .. project_name
    return workspace_dir
end

local function java_keymaps()
    -- Allow yourself to run JdtCompile as a Vim command
    vim.cmd("command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)")
    -- Allow yourself/register to run JdtUpdateConfig as a Vim command
    vim.cmd("command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
    -- Allow yourself/register to run JdtBytecode as a Vim command
    vim.cmd("command! -buffer JdtBytecode lua require('jdtls').javap()")
    -- Allow yourself/register to run JdtShell as a Vim command
    vim.cmd("command! -buffer JdtJshell lua require('jdtls').jshell()")

    -- Set a Vim motion to <Space> + <Shift>J + o to organize imports in normal mode
    vim.keymap.set('n', '<leader>Jo', "<Cmd> lua require('jdtls').organize_imports()<CR>", { desc = "[J]ava [O]rganize Imports" })
    -- Set a Vim motion to <Space> + <Shift>J + v to extract the code under the cursor to a variable
    vim.keymap.set('n', '<leader>Jv', "<Cmd> lua require('jdtls').extract_variable()<CR>", { desc = "[J]ava Extract [V]ariable" })
    -- Set a Vim motion to <Space> + <Shift>J + v to extract the code selected in visual mode to a variable
    vim.keymap.set('v', '<leader>Jv', "<Esc><Cmd> lua require('jdtls').extract_variable(true)<CR>", { desc = "[J]ava Extract [V]ariable" })
    -- Set a Vim motion to <Space> + <Shift>J + <Shift>C to extract the code under the cursor to a static variable
    vim.keymap.set('n', '<leader>JC', "<Cmd> lua require('jdtls').extract_constant()<CR>", { desc = "[J]ava Extract [C]onstant" })
    -- Set a Vim motion to <Space> + <Shift>J + <Shift>C to extract the code selected in visual mode to a static variable
    vim.keymap.set('v', '<leader>JC', "<Esc><Cmd> lua require('jdtls').extract_constant(true)<CR>", { desc = "[J]ava Extract [C]onstant" })
    -- Set a Vim motion to <Space> + <Shift>J + t to run the test method currently under the cursor
    vim.keymap.set('n', '<leader>Jt', "<Cmd> lua require('jdtls').test_nearest_method()<CR>", { desc = "[J]ava [T]est Method" })
    -- Set a Vim motion to <Space> + <Shift>J + t to run the test method that is currently selected in visual mode
    vim.keymap.set('v', '<leader>Jt', "<Esc><Cmd> lua require('jdtls').test_nearest_method(true)<CR>", { desc = "[J]ava [T]est Method" })
    -- Set a Vim motion to <Space> + <Shift>J + <Shift>T to run an entire test suite (class)
    vim.keymap.set('n', '<leader>JT', "<Cmd> lua require('jdtls').test_class()<CR>", { desc = "[J]ava [T]est Class" })
    -- Set a Vim motion to <Space> + <Shift>J + u to update the project configuration
    vim.keymap.set('n', '<leader>Ju', "<Cmd> JdtUpdateConfig<CR>", { desc = "[J]ava [U]pdate Config" })
end

local function setup_jdtls()
    -- Get access to the jdtls plugin and all of its functionality
    local jdtls = require "jdtls"

    -- Get the paths to the jdtls jar, operating specific configuration directory, and lombok jar
    local launcher, os_config, lombok = get_jdtls()

    -- Get the path you specified to hold project information
    local workspace_dir = get_workspace()

    -- Get the bundles list with the jars to the debug adapter, and testing adapters
    local bundles = get_bundles()

    -- Determine the root directory of the project by looking for these specific markers
    local root_dir = jdtls.setup.find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' });
    
    -- Tell our JDTLS language features it is capable of
    local capabilities = {
        workspace = {
            configuration = true
        },
        textDocument = {
            completion = {
                snippetSupport = false
            }
        }
    }

    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    for k,v in pairs(lsp_capabilities) do capabilities[k] = v end

    -- Get the default extended client capablities of the JDTLS language server
    local extendedClientCapabilities = jdtls.extendedClientCapabilities
    -- Modify one property called resolveAdditionalTextEditsSupport and set it to true
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

    -- Set the command that starts the JDTLS language server jar
    local cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. lombok,
        '-jar',
        launcher,
        '-configuration',
        os_config,
        '-data',
        workspace_dir
    }

     -- Configure settings in the JDTLS server
    local settings = {
        java = {
            -- Enable code formatting
            format = {
                enabled = true,
                -- Use the Google Style guide for code formattingh
                settings = {
                    url = vim.fn.stdpath("config") .. "/lang_servers/intellij-java-google-style.xml",
                    profile = "GoogleStyle"
                }
            },
            -- Enable downloading archives from eclipse automatically
            eclipse = {
                downloadSource = true
            },
            -- Enable downloading archives from maven automatically
            maven = {
                downloadSources = true
            },
            -- Enable method signature help
            signatureHelp = {
                enabled = true
            },
            -- Use the fernflower decompiler when using the javap command to decompile byte code back to java code
            contentProvider = {
                preferred = "fernflower"
            },
            -- Setup automatical package import oranization on file save
            saveActions = {
                organizeImports = true
            },
            -- Customize completion options
            completion = {
                -- When using an unimported static method, how should the LSP rank possible places to import the static method from
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
                -- Try not to suggest imports from these packages in the code action window
                filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*",
                    "sun.*",
                },
                -- Set the order in which the language server should organize imports
                importOrder = {
                    "java",
                    "jakarta",
                    "javax",
                    "com",
                    "org",
                }
            },
            sources = {
                -- How many classes from a specific package should be imported before automatic imports combine them all into a single import
                organizeImports = {
                    starThreshold = 9999,
                    staticThreshold = 9999
                }
            },
            -- How should different pieces of code be generated?
            codeGeneration = {
                -- When generating toString use a json format
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
                },
                -- When generating hashCode and equals methods use the java 7 objects method
                hashCodeEquals = {
                    useJava7Objects = true
                },
                -- When generating code use code blocks
                useBlocks = true
            },
             -- If changes to the project will require the developer to update the projects configuration advise the developer before accepting the change
            configuration = {
                updateBuildConfiguration = "interactive"
            },
            -- enable code lens in the lsp
            referencesCodeLens = {
                enabled = true
            },
            -- enable inlay hints for parameter names,
            inlayHints = {
                parameterNames = {
                    enabled = "all"
                }
            }
        }
    }

    -- Create a table called init_options to pass the bundles with debug and testing jar, along with the extended client capablies to the start or attach function of JDTLS
    local init_options = {
        bundles = bundles,
        extendedClientCapabilities = extendedClientCapabilities
    }

    -- Function that will be ran once the language server is attached
    local on_attach = function(_, bufnr)
        -- Map the Java specific key mappings once the server is attached
        java_keymaps()

        -- Setup the java debug adapter of the JDTLS server
        require('jdtls.dap').setup_dap()

        -- Find the main method(s) of the application so the debug adapter can successfully start up the application
        -- Sometimes this will randomly fail if language server takes too long to startup for the project, if a ClassDefNotFoundException occurs when running
        -- the debug tool, attempt to run the debug tool while in the main class of the application, or restart the neovim instance
        -- Unfortunately I have not found an elegant way to ensure this works 100%
        require('jdtls.dap').setup_dap_main_class_configs()
        -- Enable jdtls commands to be used in Neovim
        require 'jdtls.setup'.add_commands()
        -- Refresh the codelens
        -- Code lens enables features such as code reference counts, implemenation counts, and more.
        vim.lsp.codelens.refresh()

        -- Setup a function that automatically runs every time a java file is saved to refresh the code lens
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.java" },
            callback = function()
                local _, _ = pcall(vim.lsp.codelens.refresh)
            end
        })
    end

    -- Create the configuration table for the start or attach function
    local config = {
        cmd = cmd,
        root_dir = root_dir,
        settings = settings,
        capabilities = capabilities,
        init_options = init_options,
        on_attach = on_attach
    }

    -- Start the JDTLS server
    require('jdtls').start_or_attach(config)
end

return {
    setup_jdtls = setup_jdtls,
}
```
## 6. autocmd setup ```~/.config/nvim/lua/config/autocmds.lua```
```
-- Setup our JDTLS server any time we open up a java file
vim.cmd [[
    augroup jdtls_lsp
        autocmd!
        autocmd FileType java lua require'config.jdtls'.setup_jdtls()
    augroup end
]]
```
