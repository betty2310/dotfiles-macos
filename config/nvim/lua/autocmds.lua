local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
})

vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
    pattern = "tsconfig*.json",
    callback = function()
        vim.opt.filetype = "jsonc"
    end,
})
