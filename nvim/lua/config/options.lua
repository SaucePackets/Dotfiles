-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt -- for conciseness

-- General Settings
vim.wo.relativenumber = true

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.number = true
-- opt["guicursor"] = ""

opt.spelllang = "en_us"
opt.spell = true
opt.showcmd = true
opt.fillchars = { eob = " " }
opt.title = true
opt.hlsearch = true
opt.cmdheight = 1
opt.laststatus = 2
opt.scrolloff = 5
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })

-- Open new window
opt.splitbelow = true
opt.splitright = true

-- tabs & indentation
-- opt.tabstop = 2 -- 2 spaces for tabs
-- opt.shiftwidth = 2 -- 2 spaces for indent width
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.autoindent = true -- auto indent
opt.expandtab = true
opt.smartindent = true
opt.smarttab = true

-- line wrapping
opt.wrap = false -- disable line wrapping
opt.linebreak = true -- enable linebreak

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- Concealer for Neorg and obsidian
opt.conceallevel = 2

-- Set fold method to 'indent'
opt.foldmethod = "indent"

-- Set initial fold level to 99 (open all folds by default)
opt.foldlevelstart = 99

-- Turn off formatting on save
vim.g.autoformat = false
vim.opt.list = false
