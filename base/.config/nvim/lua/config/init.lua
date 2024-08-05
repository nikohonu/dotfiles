vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

require("config.maps")
require("config.lazy")
