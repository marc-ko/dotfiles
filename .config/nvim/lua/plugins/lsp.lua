require("mason").setup({
    ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    -- ensuring installed
    ensure_installed = {
        "lua_ls",
        "pyright",
    },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup{
    capabilities = capabilities,
}

require("lspconfig").clangd.setup{
    capabilities = capabilities,
}
require("lspconfig").pyright.setup{
    capabilities = capabilities,
}
require("lspconfig").texlab.setup{
    capabilities = capabilities,
}
