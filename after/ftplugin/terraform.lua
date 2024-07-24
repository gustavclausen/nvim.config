local wk = require("which-key")
wk.add({
  { "<leader>c", group = "Coding" },
  { "<leader>ct", group = "Terraform" },
  { "<leader>cti", "<cmd>Terraform init<CR>", desc = "terraform init", silent = true },
  { "<leader>ctv", "<cmd>Terraform validate<CR>", desc = "terraform validate", silent = true },
})
