-- Begin bug fix thing
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)
-- End bug fix thing
require('nvim-autopairs').setup{}




require'nvim-treesitter.configs'.setup { 
    indent = { enable = true }, 
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    autotag = { enable = true },
    additional_vim_regex_highlighting = false,
}
