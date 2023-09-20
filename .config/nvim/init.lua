require("plugins")

-- basic confs
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- shortcuts
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>.", vim.cmd.Ex)
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- catppuccin
require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    no_italic = true,
})
vim.cmd.colorscheme "catppuccin"

-- lsp
local lspconfig = require('lspconfig')

local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
    }, {
        { name = 'buffer' },
    }),
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lsp config start

-- lspconfig.pyright.setup {
--     capabilities = capabilities
-- }

lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false,
            }
        }
    }
}

lspconfig.pylsp.setup {
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                -- pycodestyle = {
                --     maxLineLength = 80
                --     -- enabled = false,
                --     -- ignore = {'E225','E231'},
                -- },
                -- pydocstyle = {
                --     -- enabled= false
                -- },
                pylint = {
                    enabled = true
                }
            }
        }
    }
}

lspconfig.marksman.setup {
    capabilities = capabilities,
}

lspconfig.lua_ls.setup {
    capabilities = capabilities,
}

lspconfig.bashls.setup {
    capabilities = capabilities,
}

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set({ 'n', 'i' }, '<C-s>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'i' }, '<C-a>', vim.lsp.buf.code_action, opts)
        vim.keymap.set({ 'n', 'i' }, '<C-f>', vim.lsp.buf.hover, opts)
        vim.keymap.set({ 'n', 'i' }, '<C-d>', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    end,
})
-- lsp config end

-- Python config for pyright
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = "python",
--     callback = function()
--         vim.keymap.set("n", "<leader>f", ":IsortSync<CR>:Black<CR>")
--         vim.keymap.set("n", "<leader>r", ":LspRestart<CR>")
--     end,
-- })

-- treesitter.lua
require("nvim-treesitter.configs").setup {
    ensure_installed = { "c", "lua", "python", "rust", "bash" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
