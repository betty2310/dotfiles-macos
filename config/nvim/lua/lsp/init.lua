local utils = require "utils"

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or { { " ", "FloatBorder" } }
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = { noremap = true, silent = true, nowait = true }
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>lp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>ln", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Lspsaga preview_definition<CR>", opts)
    vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true, noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<space>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>lr", "<cmd>Lspsaga rename<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>lc", "<cmd>Lspsaga code_action<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

    if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.formatting_sync()
            end,
        })
    end
end

for type, icon in pairs(utils.signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config {
    virtual_text = {
        source = "always",
        prefix = " ",
        spacing = 6,
    },
    float = {
        source = "always",
    },
    signs = true,
    underline = false,
    update_in_insert = false,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local _cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if _cmp_nvim_lsp then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

require("nvim-lsp-installer").setup {}
local lspconfig = require "lspconfig"
local servers = { "sumneko_lua", "clangd", "rust_analyzer", "tsserver" }
if lspconfig then
    for _, server in ipairs(servers) do
        require("lsp.servers." .. server).setup(on_attach, capabilities)
    end
end
