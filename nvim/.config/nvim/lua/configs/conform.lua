local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    markdown = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    xml = { "xmllint" },
    toml = { "taplo" },
    cpp = { "clang-format" }
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
