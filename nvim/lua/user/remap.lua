vim.g.mapleader =
    ' '
-- Open file explorer in current file folder
vim.keymap.set(
    'n',
    '<leader>pv',
    function()
        vim.cmd(
            'Oil'
        )
    end
)
-- Move code with   alt+<direction>
vim.keymap.set(
    'n',
    '<A-j>',
    ':m .+1<CR>=='
) -- move line up(n)
vim.keymap.set(
    'n',
    '<A-k>',
    ':m .-2<CR>=='
) -- move line down(n)
vim.keymap.set(
    'v',
    '<A-j>',
    ":m '>+1<CR>gv=gv"
) -- move line up(v)
vim.keymap.set(
    'v',
    '<A-k>',
    ":m '<-2<CR>gv=gv"
) -- move line down(v)
-- LSP remap
vim.keymap.set(
    'n',
    '<space>e',
    vim.diagnostic.open_float
)
vim.keymap.set(
    'n',
    '[d',
    vim.diagnostic.goto_prev
)
vim.keymap.set(
    'n',
    ']d',
    vim.diagnostic.goto_next
)
vim.keymap.set(
    'n',
    '<space>q',
    vim.diagnostic.setloclist
)
vim.api.nvim_create_autocmd(
    'LspAttach',
    {
        group = vim.api.nvim_create_augroup(
            'UserLspConfig',
            {}
        ),
        callback = function(
            ev
        )
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc =
                'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts =
                {
                    buffer = ev.buf,
                }
            vim.keymap.set(
                'n',
                'gD',
                vim.lsp.buf.declaration,
                opts
            )
            vim.keymap.set(
                'n',
                'gd',
                vim.lsp.buf.definition,
                opts
            )
            vim.keymap.set(
                'n',
                'K',
                vim.lsp.buf.hover,
                opts
            )
            vim.keymap.set(
                'n',
                'gi',
                vim.lsp.buf.implementation,
                opts
            )
            vim.keymap.set(
                'n',
                '<C-k>',
                vim.lsp.buf.signature_help,
                opts
            )
            vim.keymap.set(
                'n',
                '<space>wa',
                vim.lsp.buf.add_workspace_folder,
                opts
            )
            vim.keymap.set(
                'n',
                '<space>wr',
                vim.lsp.buf.remove_workspace_folder,
                opts
            )
            vim.keymap.set(
                'n',
                '<space>wl',
                function()
                    print(
                        vim.inspect(
                            vim.lsp.buf.list_workspace_folders()
                        )
                    )
                end,
                opts
            )
            vim.keymap.set(
                'n',
                '<space>D',
                vim.lsp.buf.type_definition,
                opts
            )
            vim.keymap.set(
                'n',
                '<space>rn',
                vim.lsp.buf.rename,
                opts
            )
            vim.keymap.set(
                {
                    'n',
                    'v',
                },
                '<space>ca',
                vim.lsp.buf.code_action,
                opts
            )
            vim.keymap.set(
                'n',
                'gr',
                vim.lsp.buf.references,
                opts
            )
            vim.keymap.set(
                'n',
                '<space>f',
                function()
                    vim.lsp.buf.format({
                        async = true,
                    })
                end,
                opts
            )
        end,
    }
)
-- CarbonNow remap
vim.keymap.set(
    'v',
    '<leader>cn',
    ':CarbonNow<CR>',
    {
        silent = true,
    }
)
