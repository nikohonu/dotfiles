local options = {
	nu = true,
	relativenumber = true,

	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,

	smartindent = true,

	swapfile = false,
	backup = false,
	undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir",
	undofile = true,

	updatetime = 50,
	colorcolumn = "80",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "gdscript",
	callback = function(args)
		local options = {
			expandtab = false,
		}
		for k, v in pairs(options) do
			vim.opt[k] = v
		end
	end,
})
vim.opt_local.conceallevel = 2
