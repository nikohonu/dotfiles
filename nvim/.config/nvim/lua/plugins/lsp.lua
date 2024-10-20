return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		local capabilities = nil
		if pcall(require, "cmp_nvim_lsp") then
			capabilities = require("cmp_nvim_lsp").default_capabilities()
		end

		local lspconfig = require("lspconfig")

		local servers = {
			mesonlsp = true,
			bashls = true,
			lua_ls = true,
			rust_analyzer = true,
			jsonls = true,
			yamlls = true,
			clangd = true,
			basedpyright = true,
			marksman = true,
			ts_ls = true,
			ltex = {
				filetypes = {
					"bib",
					"gitcommit",
					"markdown",
					"org",
					"plaintex",
					"rst",
					"rnoweb",
					"tex",
					"pandoc",
					"quarto",
					"rmd",
					"norg",
				},
				settings = {
					ltex = {
						language = "en-US",
					},
				},
			},
			zls = true,
		}

		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"lua_ls",
				"marksman",
				"ltex",
				"zls",
				"clangd",
				"rust_analyzer",
				"gdtoolkit",
				"prettier",
				"typescript-language-server"
			},
		})

		for name, config in pairs(servers) do
			if config == true then
				config = {}
			end
			config = vim.tbl_deep_extend("force", {}, {
				capabilities = capabilities,
			}, config)

			lspconfig[name].setup(config)
		end

		local disable_semantic_tokens = {
			lua = true,
		}
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

				local opts = { buffer = 0, noremap = true, silent = true }
				vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "<leader>[d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "<leader>]d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

				local filetype = vim.bo[bufnr].filetype
				if disable_semantic_tokens[filetype] then
					client.server_capabilities.semanticTokensProvider = nil
				end
			end,
		})
	end,
}
