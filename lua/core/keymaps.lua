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

-- leader based (normal mode)
wk.register({
  s = {
    name = "Splits",
    v = { "<C-W>v", "Split window vertically" },
    h = { "<C-W>s", "Split window horizontally" },
    e = { "<C-W>=", "Make split windows equal width and height" },
    x = { "<cmd>close<CR>", "Close current split window" },
  },
  n = {
    name = "Search",
    h = { "<cmd>nohl<CR>", "Remove search highlight" },
  },
  t = {
    name = "Tabs",
    t = { "<cmd>tabnew<CR>", "Create new tab" },
    d = { "<cmd>tabclose<CR>", "Close current tab" },
    n = { "<cmd>tabn<CR>", "Navigate to next tab" },
    p = { "<cmd>tabn<CR>", "Navigate to previous tab" },
  },
  f = {
    name = "Files",
    f = { "<cmd>Telescope find_files<CR>", "Find files" },
    s = { "<cmd>Telescope live_grep<CR>", "Find string in files" },
  },
  e = { "<cmd>Neotree reveal<CR>", "Show and/or focus on tree explorer" },
  b = {
    name = "Buffer",
    n = { "<C-i>", "Next buffer" },
    p = { "<C-o>", "Previous buffer" },
  },
  w = {
    name = "Window",
    r = { "<C-w>=", "Equalize width and height of all windows" },
  },
  -- misc
  m = {
    name = "Misc",
    l = {
      name = "List",
      b = {
        "<cmd>Telescope buffers<CR>",
        "Lists open buffers in current neovim instance",
      },
      c = {
        "<cmd>Telescope command_history<CR>",
        "Lists commands that were executed recently and reruns them when selected",
      },
      s = {
        "<cmd>Telescope search_history<CR>",
        "Lists searches that were executed recently and reruns them when selected",
      },
    },
    g = { name = "Git", g = { "<cmd>LazyGit<CR>", "Open LazyGit" } },
    s = {
      name = "Snippets",
      r = {
        "<cmd>source ~/.config/nvim/snippets/*<cr>",
        "Reload snippets",
      },
    },
  },
}, { prefix = "<leader>", mode = "n" })
