local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "config.plugins" },
    { import = "config.plugins.lsp" },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { { "nvim-lua/plenary.nvim" }, { "laher/neorg-exec" }, { "nvim-neorg/neorg-telescope" } },
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {}, -- Loads default behavior
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.summary"] = {},
                    ["core.export"] = {},
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp",
                        },
                    },
                    ["core.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                        },
                    },
                },
            })
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function()
            require("noice").setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                routes = {
                    {
                        filter = { event = "notify", find = "No information available" },
                        opts = { skip = true },
                    },
                    {
                        view = "notify",
                        filter = { event = "msg_showmode" },
                    },
                },
                presets = {
                    lsp_doc_border = true,
                    bottom_search = true,
                    command_palette = true,
                    long_message_to_split = true,
                    inc_rename = true,
                },
            })
        end,
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            { "rcarriga/nvim-notify", opts = { timeout = 1000 } },
        },
    },
    {
        "echasnovski/mini.animate",
        event = "VeryLazy",
        opts = function(_, opts)
            opts.scroll = {
                enable = false,
            }
        end,
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        window = {
            options = {
                signcolumn = "no",
                number = false,
            },
        },
        plugins = {
            options = {
                enabled = true,
                ruler = false,
                laststatus = 0,
            },
            twilight = { enabled = true },
            gitsigns = { enabled = false },
            tmux = { enabled = true },
            alacritty = { enabled = true, font = "14" },
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },
    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("noice").setup({
                presets = { inc_rename = true },
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        config = true,
        -- stylua: ignore
        keys = {
            { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
            { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
            { "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
            { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
            { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
            { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
        },
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    { "ThePrimeagen/vim-be-good" },
    { "folke/twilight.nvim" },
    { "craigmac/nvim-supertab" },
    { "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },
    { "preservim/vim-pencil" },
})
