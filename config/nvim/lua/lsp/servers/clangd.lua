local _M = {}

_M.setup = function(on_attach, capabilities)
    require("lspconfig").clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end
return _M
