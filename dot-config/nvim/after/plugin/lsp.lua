local c_cpp = 'clangd'
local harper = 'harper_ls'
local lua = 'lua_ls'
local python = 'pylsp'
local rust = 'rust_analyzer'
local json = 'jsonls'

vim.lsp.inlay_hint.enable(true)

vim.lsp.config('*', {
    root_markers = { '.git' },
})

vim.lsp.config(lua, {
    settings = {
        Lua = { diagnostics = { globals = { "vim" } } }
    }
})

vim.lsp.config(rust, {
    settings = {
        checkOnSave = true,
        check = {
            command = "cargo clippy"
        }
    },
})

vim.diagnostic.config({
    virtual_text = {
        source = 'always',
        prefix = '●'
    },
    severity_sort = true,
    float = {
        source = "always",
    },
    signs = {
        active = true,
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        }
    }
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        -- LSP key bindings
        local opts = { buffer = args.buf, remap = false }
        if client:supports_method('textDocument/implementation') then
            vim.keymap.set("n", "gi", vim.lsp.buf.definition, opts)
        end
        if client:supports_method('textDocument/definition') then
            vim.keymap.set("n", "gd", vim.lsp.buf.implementation, opts)
        end
        if client:supports_method('textDocument/declaration') then
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        end
        if client:supports_method('textDocument/hover') then
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end
        if client:supports_method('textDocument/workspaceSymbol') then
            vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        end
        if client:supports_method('textDocument/codeAction') then
            vim.keymap.set("n", "<leader>vc", vim.lsp.buf.code_action, opts)
        end
        if client:supports_method('textDocument/references') then
            vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        end
        if client:supports_method('textDocument/rename') then
            vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        end
        if client:supports_method('textDocument/signatureHelp') then
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        end

        -- diagnostic key bindings
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)

        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
        end
        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})
