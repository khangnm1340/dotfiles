-- Plugins: plugin manager and configurations

-- Core plugin list (vim.pack)
vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.nvim" },
    { src = "https://github.com/zbirenbaum/copilot.lua" },
    { src = "https://github.com/norcalli/nvim-colorizer.lua" },
    { src = "https://github.com/folke/flash.nvim" },
    { src = "https://github.com/mbbill/undotree" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/kdheepak/lazygit.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/mikavilpas/yazi.nvim" },
    { src = "https://github.com/opdavies/toggle-checkbox.nvim" },
    { src = "https://github.com/jake-stewart/multicursor.nvim" },
})

-- Undotree config
vim.g.undotree_DiffAutoOpen       = 1
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_DiffCommand        = 'diff -u'
vim.g.undotree_WindowLayout       = 2

-- Mini and Mason
require('mason').setup()
require('mini.pick').setup()
require('mini.ai').setup()
require('mini.surround').setup({
    mappings = {
        add = 'gsa',
        delete = 'gsd',
        replace = 'gsr',
        find = 'gsf',
        find_left = 'gsF',
        highlight = 'gsh',
        update_n_lines = '',
    },
})
require('mini.pairs').setup()
---@diagnostic disable-next-line: assign-type-mismatch, need-check-nil
require('mini.extra').setup()
require('mini.deps').setup()
require('colorizer').setup()

-- Multicursor plugin (basic setup)
do
    local ok, mc = pcall(require, 'multicursor-nvim')
    if ok and not vim.g.__mc_loaded then
        mc.setup()
        vim.g.__mc_loaded = true
    end
end

-- Additional plugins via MiniDeps
MiniDeps.add({
    source = 'saghen/blink.cmp',
    depends = { 'rafamadriz/friendly-snippets' },
    checkout = 'v1.6.0',
})

require('blink.cmp').setup({
    keymap = { preset = 'default' },
    appearance = { nerd_font_variant = 'mono' },
    completion = { documentation = { auto_show = false } },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
})

-- Flash
require('flash').setup({
    labels = 'jkluioprewtfsgvmbq',
    highlight = {},
    modes = {
        char = {
            jump_labels = true,
            label = { exclude = 'o' },
            multi_line = true,
            highlight = { backdrop = true },
        },
    },
})

-- Copilot
require('copilot').setup()

-- Treesitter via MiniDeps
MiniDeps.add({
    source = 'nvim-treesitter/nvim-treesitter',
    hooks  = {
        post_install  = function() vim.cmd('TSUpdate') end,
        post_checkout = function() vim.cmd('TSUpdate') end,
    },
})

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'lua', 'vim', 'vimdoc', 'query',
        'bash', 'python', 'json', 'yaml', 'toml',
        'markdown', 'markdown_inline',
        'regex', 'c', 'rust', 'typst', 'nu',
    },
    auto_install = true,
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection    = '<CR>',
            node_incremental  = '<CR>',
            node_decremental  = '<BS>',
            scope_incremental = '<Tab>',
        },
    },
})

-- LSP
vim.lsp.enable({ 'emmylua_ls', 'tinymist' })
vim.lsp.config('tinymist', {
    cmd = { 'tinymist' },
    filetypes = { 'typst' },
    settings = { formatterMode = 'typstyle' },
})

-- Mini.pick registry helper
do
    local MiniPick = require('mini.pick')
    MiniPick.registry.files = function(local_opts)
        local opts = { source = { cwd = local_opts.cwd } }
        local_opts.cwd = nil
        return MiniPick.builtin.files(local_opts, opts)
    end
end

-- UI / Colors
require('tokyonight').setup({
    transparent = not vim.g.neovide,
})
vim.cmd('colorscheme tokyonight')
vim.cmd('hi statusline guibg=NONE')

