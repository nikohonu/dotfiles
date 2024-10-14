-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "day",
-- 		})
-- 		vim.cmd([[colorscheme tokyonight]])
-- 	end,
-- }
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup {
			flavour = "latte",
			transparent_background = true,
		};
		vim.cmd.colorscheme "catppuccin"
	end,
}
