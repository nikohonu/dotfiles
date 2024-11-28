local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup("autoupdate"),
    callback = function()
        if require("lazy.status").has_updates then
            require("lazy").update({ show = false, })
        end
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {"*.frag", "*.vert"},
    callback = function()
        vim.cmd("setfiletype glsl");
        vim.cmd("TSEnable highlight");
    end,
})

