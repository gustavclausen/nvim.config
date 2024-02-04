local wk = require("which-key")
local default_options = { silent = true }
wk.register({
  c = {
    name = "Coding",
    t = {
      name = "Terraform",
      i = { "<cmd>Terraform init<CR>", "terraform init" },
      v = { "<cmd>Terraform validate<CR>", "terraform validate" },
    },
  },
}, { prefix = "<leader>", mode = "n", default_options })
