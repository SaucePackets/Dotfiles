-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- set leader key to space
local keymap = vim.keymap -- for conciseness
-- local neogit = require("neogit")
local wk = require("which-key")

----------------------- General Keymaps -------------------

-- Clear search highlighting
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlighting" })

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Delete a word backwards
keymap.set("n", "db", 'vb"_d')

-- window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab

-- Resize window
-- keymap.set("n", "<C-w><left>", "<C-w><")
-- keymap.set("n", "<C-w><right>", "<C-w>>")
-- keymap.set("n", "<C-w><up>", "<C-w>+")
-- keymap.set("n", "<C-w><down>", "<C-w>-")

-- Terraform
keymap.set("n", "<leader>td", "<cmd>:Telescope terraform_doc<CR>", { desc = "Open Terraform docs" })
keymap.set("n", "<leader>tm", "<cmd>:Telescope terraform_doc modules<CR>", { desc = "Open Terraform modules" })
keymap.set(
  "n",
  "<leader>ta",
  "<cmd>:Telescope terraform_doc :Telescope terraform_doc full_name=hashicorp/aws<CR>",
  { desc = "Open AWS Terraform docs" }
)
keymap.set(
  "n",
  "<leader>tg",
  "<cmd>:Telescope terraform_doc :Telescope terraform_doc full_name=hashicorp/google<CR>",
  { desc = "Open Google Terraform docs" }
)
keymap.set(
  "n",
  "<leader>tk",
  "<cmd>:Telescope terraform_doc full_name=hashicorp/kubernetes<CR>",
  { desc = "Open Kubernetes Terraform docs" }
)

-- Git
-- keymap.set("n", "<leader>go", neogit.open, { silent = true, noremap = true })
-- keymap.set("n", "<leader>gc", ":Neogit commit<CR>", { silent = true, noremap = true })
-- keymap.set("n", "<leader>gp", ":Neogit pull<CR>", { silent = true, noremap = true })
-- keymap.set("n", "<leader>gP", ":Neogit push<CR>", { silent = true, noremap = true })
-- keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { silent = true, noremap = true })
-- keymap.set("n", "<leader>gB", ":G blame<CR>", { silent = true, noremap = true })

vim.keymap.set("n", "<C-S-h>", require("smart-splits").resize_left, { desc = "resize left" })
vim.keymap.set("n", "<C-S-j>", require("smart-splits").resize_down, { desc = "resize down" })
vim.keymap.set("n", "<C-S-k>", require("smart-splits").resize_up, { desc = "resize up" })
vim.keymap.set("n", "<C-S-l>", require("smart-splits").resize_right, { desc = "resize right" })
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left pane" })
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to pane below" })
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to pane above" })
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right pane" })
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous, { desc = "Move to previous pane" })
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left, { desc = "Swap left" })
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down, { desc = "Swap down" })
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up, { desc = "Swap up" })
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right, { desc = "Swap right" })
