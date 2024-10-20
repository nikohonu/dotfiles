require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- oil.nvim
map("n", "<leader>o", "<cmd>Oil<cr>")

-- nvim-dap
map("n", "<leader>dr", function()
  require('dap').continue()
end, { desc = "Start or continues the debugger" })
map("n", "<leader>db", function()
  require('dap').toggle_breakpoint()
end, { desc = "Add breakpoint at line" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
