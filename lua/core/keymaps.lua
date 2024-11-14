local map = vim.keymap.set
local wk = require("which-key")

-- Navigation
map("n", "<C-h>", "<cmd>NavigatorLeft<CR>")
map("n", "<C-j>", "<cmd>NavigatorDown<CR>")
map("n", "<C-k>", "<cmd>NavigatorUp<CR>")
map("n", "<C-l>", "<cmd>NavigatorRight<CR>")

map("n", "<Tab>", ">>_", { noremap = true })
map("n", "<S-Tab>", "<<_", { noremap = true })

map("n", "Q", "<cmd>qall<CR>") -- Close all buffers and quit vim
map("n", "<cr>", "ciw") -- Quickly jump into changing word with insert mode
map("i", "jk", "<Esc>") -- Quickly change to normal mode
map("v", "y", "ygv<Esc>") -- Keep position after visual mode copy

-- Don't yank/cut on delete per default
map("n", "d", '"_d', { noremap = true })
map("v", "d", '"_d', { noremap = true })

wk.add({
  { "<leader>b", group = "Buffer" },
  { "<leader>bn", "<C-i>", desc = "Next buffer" },
  { "<leader>bp", "<C-o>", desc = "Previous buffer" },
  { "<leader>bs", "<cmd>FzfLua buffers<CR>", desc = "Lists open buffers in current neovim instance" },
  { "<leader>e", "<cmd>Neotree reveal<CR>", desc = "Show and/or focus on tree explorer" },
  { "<leader>u", "<cmd>Telescope undo<CR>", desc = "Show undotree (Telescope)" },
  { "<leader>f", group = "Files" },
  { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
  { "<leader>fs", "<cmd>Telescope live_grep<CR>", desc = "Find string in files" },
  { "<leader>m", group = "Misc" },
  { "<leader>mc", group = "Command" },
  { "<leader>mch", "<cmd>FzfLua command_history<CR>" },
  { "<leader>mg", group = "Git" },
  { "<leader>mgg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
  { "<leader>ml", group = "List" },
  {
    "<leader>mlc",
    "<cmd>Telescope command_history<CR>",
    desc = "Lists commands that were executed recently and reruns them when selected",
  },
  {
    "<leader>mls",
    "<cmd>Telescope search_history<CR>",
    desc = "Lists searches that were executed recently and reruns them when selected",
  },
  { "<leader>ms", group = "Snippets" },
  { "<leader>msr", "<cmd>source ~/.config/nvim/snippets/*<cr>", desc = "Reload snippets" },
  { "<leader>n", group = "Search" },
  { "<leader>nh", "<cmd>nohl<CR>", desc = "Remove search highlight" },
  { "<leader>s", group = "Splits" },
  { "<leader>se", "<C-W>=", desc = "Make split windows equal width and height" },
  { "<leader>sh", "<C-W>s", desc = "Split window horizontally" },
  { "<leader>sv", "<C-W>v", desc = "Split window vertically" },
  { "<leader>sx", "<cmd>close<CR>", desc = "Close current split window" },
  { "<leader>t", group = "Tabs" },
  { "<leader>td", "<cmd>tabclose<CR>", desc = "Close current tab" },
  { "<leader>tn", "<cmd>tabn<CR>", desc = "Navigate to next tab" },
  { "<leader>tp", "<cmd>tabn<CR>", desc = "Navigate to previous tab" },
  { "<leader>tt", "<cmd>tabnew<CR>", desc = "Create new tab" },
  { "<leader>w", group = "Window" },
  { "<leader>wr", "<C-w>=", desc = "Equalize width and height of all windows" },
})
