return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			markdown = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			xml = { "xmllint" },
			toml = {"taplo"}
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
