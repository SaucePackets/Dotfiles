-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap -- for conciseness

----------------------- General Keymaps -------------------

-- Clear search highlighting (also with <Esc>)
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlighting" })
keymap.set("n", "<Esc>", "<cmd>nohl<CR><Esc>", { desc = "Clear search highlighting" })

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Delete a word backwards
keymap.set("n", "db", 'vb"_d')

-- Better up/down (handles wrapped lines)
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

----------------------- Window Navigation -------------------

-- window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>ww", "<C-w>p", { desc = "Other Window", remap = true })
keymap.set("n", "<leader>wd", "<C-w>c", { desc = "Delete Window", remap = true })
keymap.set("n", "<leader>-", "<C-w>s", { desc = "Split Below", remap = true })
keymap.set("n", "<leader>|", "<C-w>v", { desc = "Split Right", remap = true })

-- Resize windows with Ctrl+Arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease Window Width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase Window Width" })

-- Tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- open current buffer in new tab

----------------------- Quickfix & Diagnostics Navigation -------------------

-- Quickfix navigation
keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Previous Quickfix" })
keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next Quickfix" })
keymap.set("n", "[Q", "<cmd>cfirst<CR>", { desc = "First Quickfix" })
keymap.set("n", "]Q", "<cmd>clast<CR>", { desc = "Last Quickfix" })

-- Location list navigation
keymap.set("n", "[l", "<cmd>lprev<CR>", { desc = "Previous Location" })
keymap.set("n", "]l", "<cmd>lnext<CR>", { desc = "Next Location" })

-- Diagnostic navigation
keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Previous Diagnostic" })
keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Next Diagnostic" })
keymap.set("n", "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Previous Error" })
keymap.set("n", "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Next Error" })
keymap.set("n", "[w", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN }) end, { desc = "Previous Warning" })
keymap.set("n", "]w", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN }) end, { desc = "Next Warning" })

-- Diagnostic popup
keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

----------------------- Better Editor Experience -------------------

-- Move lines up/down in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Up" })

-- Better indenting (stay in visual mode)
keymap.set("v", "<", "<gv", { desc = "Indent Left" })
keymap.set("v", ">", ">gv", { desc = "Indent Right" })

keymap.set("n", "n", "nzzzv", { desc = "Next Search Result" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous Search Result" })

-- Save file (LazyVim style)
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save File" })

-- Quit shortcuts
keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit All" })

