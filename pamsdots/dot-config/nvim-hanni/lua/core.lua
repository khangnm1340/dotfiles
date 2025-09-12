-- Core: options, globals, autocmds

-- Options
vim.o.title          = true
vim.o.titlestring    = vim.fs.basename(vim.fn.getcwd())
vim.o.mouse          = 'a'
vim.o.ignorecase     = true
vim.o.smartcase      = true
vim.o.number         = false
vim.o.relativenumber = false
vim.opt.expandtab    = true
vim.o.wrap           = true
vim.o.tabstop        = 4
vim.o.shiftwidth     = 4
vim.o.signcolumn     = "yes"
vim.o.swapfile       = false
vim.g.mapleader      = " "
vim.o.winborder      = "double"
vim.o.smartindent    = true
vim.o.termguicolors  = true
vim.o.spell          = false
-- vim.o.hlsearch = false
vim.o.undofile       = true
vim.o.undodir        = vim.fn.stdpath("state") .. "/undo"
vim.o.clipboard      = "unnamedplus"
vim.o.linebreak      = true
vim.o.breakindent    = true

-- Neovide globals (no keymaps here)
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_opacity = 0.9
vim.g.neovide_normal_opacity = 0.85

-- Autocmds
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "/tmp/*",
    callback = function()
        vim.cmd("normal! G")
    end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        vim.cmd("mksession! ~/.local/share/nvim-hanni/session.vim")
    end,
})

vim.api.nvim_create_autocmd("SessionLoadPost", {
    callback = function()
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(bufnr) then
                pcall(vim.lsp.document_color.enable, false, bufnr)
            end
        end
    end,
})

