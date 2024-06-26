return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	config = function()
		local builtin = require("telescope.builtin")
		local pickers = require("telescope.pickers")
		local finders = require("telescope.finders")
		local conf = require("telescope.config").values
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>nf", function()
			builtin.find_files({ cwd = "~/documents/notes" })
		end, {})

		-- our picker function: colors
		local colors = function(opts)
			opts = opts or {}
			pickers
				.new(opts, {
					prompt_title = "colors",
					finder = finders.new_table({
						results = { "red", "green", "blue" },
					}),
					sorter = conf.generic_sorter(opts),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>tt", function()
			colors()
		end, {})
	end,
}
