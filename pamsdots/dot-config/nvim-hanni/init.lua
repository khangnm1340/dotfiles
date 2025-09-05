-- vim: set foldmethod=marker :
-- init.lua — structured single-file config

-- 1) Core Options {{{
vim.o.title = true
vim.o.titlestring = vim.fs.basename(vim.fn.getcwd())
vim.o.mouse = 'a'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "double"
vim.o.smartindent = true
vim.o.termguicolors = true
-- vim.o.hlsearch = false
vim.o.undofile = true
vim.o.undodir  = vim.fn.stdpath("state") .. "/undo"
vim.o.clipboard = "unnamedplus"
-- }}}

-- 2) Keymaps (Core) {{{
vim.keymap.set("n", "<leader><Tab>k", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><Tab>j", ":tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><Tab>l", ":tabclose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><Tab>h", ":tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<S-Esc>", [[<C-\><C-n>]])
vim.keymap.set('n', '<leader>n',
	"<cmd>new | setlocal buftype=nofile bufhidden=wipe noswapfile | 0put =execute('silent messages')<CR>",
	{ silent = true, desc = 'Open :messages in scratch buffer' }
)

-- Normal mode keymap: <leader>cp to copy parent directory
vim.keymap.set("n", "<C-z>", function()
  local parent_dir = vim.fn.expand("%:p:h")
  vim.fn.setreg("+", parent_dir)   -- copy to system clipboard (+ register)
  vim.notify("Copied: " .. parent_dir)
end, { desc = "Copy parent directory of current file" })
local map = vim.keymap.set
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>o", ":update<CR> :source<CR>", { desc = "Write + Source init.lua" })
-- map("n", "gl", ":TypstPreviewSyncCursor<CR>", { desc = "Typst: sync cursor" })
map("n", "<leader>;", vim.lsp.buf.format, { desc = "LSP: Format buffer" })
map("n", "<M-j>", ":Yazi<CR>", { desc = "Open Yazi" })
map("n", "L", ":b#<CR>", { desc = "Alternate buffer", noremap = true, silent = true })
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up",   expr = true, silent = true })
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo tree" })

map('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true, desc = 'Clear search highlight' })

map("n", "<C-a>", ":%y<CR>", { noremap = true, silent = true, desc = "Yank entire buffer" })
-- map("n", "<C-;>", ":SimpleZoomToggle<CR>", { silent = true, desc = "Toggle Simple Zoom" })
map('n', '<C-Tab>', 'za', { desc = 'Toggle fold (was: open)' })
map('n', 'gs', ':se spell!<CR>', { silent = true })

map("n", "<leader>t", ":lua require('toggle-checkbox').toggle()<CR>", { silent = true, desc = "Toggle CheckBox" })
map("n", "<leader>l", ":LazyGit<CR>", { silent = true })


--- }}}

-- 3) Packages {{{
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/mbbill/undotree" },
	-- { src = "https://github.com/fasterius/simple-zoom.nvim" },
	-- { src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	-- { src = "https://github.com/Saghen/blink.cmp" },
	-- { src = "https://github.com/rafamadriz/friendly-snippets" },

	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },

	-- { src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
	{ src = "https://github.com/opdavies/toggle-checkbox.nvim" },
	{ src = "https://github.com/jake-stewart/multicursor.nvim" },
	-- { src = "https://github.com/NvChad/showkeys",              opt = true },
})
-- }}}

-- 4) Plugin Setup {{{

vim.g.undotree_DiffAutoOpen = 1
vim.g.undotree_SetFocusWhenToggle = 1    -- jump focus to tree
vim.g.undotree_DiffCommand = 'diff -u'   -- unified format
vim.g.undotree_WindowLayout       = 2   -- layout style (1..4)

require("mason").setup()
require("mini.pick").setup()
require("mini.ai").setup()
require("mini.surround").setup({
  mappings = {
    add = 'ma',      -- Add surrounding
    delete = 'md',   -- Delete surrounding
    replace = 'mr',  -- Replace surrounding
    find = 'mf',     -- Find surrounding
    find_left = 'mF',        -- your custom find (left)
    highlight = 'mh', -- Highlight surrounding
    update_n_lines = '',     -- disable updating lines by key
  }
})
require("mini.pairs").setup()
---@diagnostic disable-next-line: assign-type-mismatch, need-check-nil
require('mini.extra').setup()
require('mini.deps').setup()
-- require("showkeys").setup({ position = "top-right" })
local mc = require("multicursor-nvim")
mc.setup()
-- require("oil").setup()


-- -- your simple keymaps
map('x', 'I', mc.insertVisual, { silent = true, desc = 'MC: Insert at starts' })
map('x', 'A', mc.appendVisual, { silent = true, desc = 'MC: Append at ends' })
map({ 'n', 'x' }, '<leader>m', function() mc.matchAddCursor(1) end, { silent = true, desc = 'MC: Match add' })
map({ 'n', 'x' }, '<Up>', function() mc.lineAddCursor(-1) end, { silent = true, desc = 'MC: Add above' })
map({ 'n', 'x' }, '<Down>', function() mc.lineAddCursor(1) end, { silent = true, desc = 'MC: Add below' })
map({ 'n', 'x' }, 'g<C-a>', mc.sequenceIncrement, { silent = true, desc = 'MC: Seq ++' })
map({ 'n', 'x' }, 'g<C-x>', mc.sequenceDecrement, { silent = true, desc = 'MC: Seq --' })
map({ "n", "x" }, "<c-q>", function() require("multicursor-nvim").toggleCursor() end,
	{ desc = "Multicursor: Toggle Cursors" })

map('n', '<leader>:', function()
	MiniExtra.pickers.history({ scope = ':' })
end, { desc = 'Command history (MiniPick)' })

mc.addKeymapLayer(function(layerSet)
	-- Select a different cursor as the main one.
	layerSet({ "n", "x" }, "<left>", mc.prevCursor)
	layerSet({ "n", "x" }, "<right>", mc.nextCursor)

	-- Delete the main cursor.
	-- layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

	-- Enable and clear cursors using escape.
	layerSet("n", "<M-esc>", function()
		if not mc.cursorsEnabled() then
			mc.enableCursors()
		else
			mc.clearCursors()
		end
	end)
end)


MiniDeps.add({
	source = "saghen/blink.cmp",
	depends = { "rafamadriz/friendly-snippets" },
	checkout = "v1.6.0", -- check releases for latest tag
})

require('blink.cmp').setup({
	-- mappings: 'default' ~ built-in-ish; try 'super-tab' or 'enter' if you prefer
	keymap = { preset = 'default' },

	appearance = { nerd_font_variant = 'mono' },

	-- docs popup only when you ask (C-Space toggles docs if menu is open)
	completion = { documentation = { auto_show = false } },

	-- sources enabled by default; keep them explicit so you can extend later
	sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },

	-- just fuzzy matcher is fastest; fall back to Lua if the binary isn’t available
	fuzzy = { implementation = 'prefer_rust_with_warning' },

})
-- require("typst-preview").setup({
-- 	open_cmd = "qutebrowser --target window %s",
-- 	follow_cursor = false, -- no auto scroll on every motion
-- })

-- require("simple-zoom").setup({
-- 	hide_tabline = true,
-- })

local flash = require("flash")
flash.setup({
	labels = "jkluioprewtfsgvmbq",
	highlight = {
		-- backdrop = false,
	},
	modes = {
		char = {
			jump_labels = true,
			label = { exclude = "o" },
			multi_line = true,
			highlight = {
				backdrop = true,
			},
		},
	},
})

-- keymaps
map({ "n", "x", "o" }, "s", function()
	flash.jump()
end, { desc = "Flash" })

map({ "n", "x", "o" }, "S", function()
	flash.treesitter({ labels = "jkluiohprewtfsgvmcbq" })
end, { desc = "Flash Treesitter" })

-- }}}

-- 5) LSP & Diagnostics {{{

MiniDeps.add({
	source = "nvim-treesitter/nvim-treesitter",
	-- nvim-treesitter uses rolling releases; no tag needed.
	-- Run TSUpdate on install/updates so parsers get compiled.
	hooks  = {
		post_install  = function() vim.cmd("TSUpdate") end,
		post_checkout = function() vim.cmd("TSUpdate") end,
	},
})
require("nvim-treesitter.configs").setup({
	-- pick your languages
	ensure_installed = {
		"lua", "vim", "vimdoc", "query",
		"bash", "python", "json", "yaml", "toml",
		"markdown", "markdown_inline",
		"regex", "c", "rust", "typst", "nu",
	},
	auto_install = true, -- auto install missing parsers
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false, -- keep it purely TS
	},
	indent = { enable = true },                -- Treesitter-based indent (some langs opt-out)
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection    = "<CR>", -- start selection
			node_incremental  = "<CR>", -- expand
			node_decremental  = "<BS>", -- shrink
			scope_incremental = "<Tab>",
		},
	},
	-- If you add the textobjects plugin later, you can enable its modules here.
	-- textobjects = { select = { enable = true, keymaps = { ["af"]="@function.outer", ["if"]="@function.inner" } } }
})

vim.lsp.enable({ "emmylua_ls", "tinymist" })


-- vim.diagnostic.enable(false)

vim.lsp.config("tinymist", {
	cmd = { "tinymist" },   -- keep it simple; lspconfig/Mason can still override PATH
	filetypes = { "typst" }, -- optional, but nice to be explicit
	settings = {
		formatterMode = "typstyle"
	},
})
-- vim.lsp.config("lua_ls",
-- 	{
-- 		settings = {
-- 			Lua = {
-- 				workspace = {
-- 					library = vim.api.nvim_get_runtime_file("", true),
-- 				}
-- 			}
-- 		}
-- 	})

-- }}}

-- 6) Pickers & Search {{{
map("n", "<leader>k", ":Pick files<CR>", { desc = "Pick files" })
map("n", "<leader>h", ":Pick help<CR>", { desc = "Pick help" })
map("n", "<M-l>", ":Pick buffers<CR>", { desc = "Pick buffers" })
map("n", "<leader>g", ":Pick grep<CR>", { desc = "Pick grep" })

-- Frequent files from Nushell history
map(
	"n",
	"<M-k>",
	":lua require('mini.pick').start({source={items=vim.fn.readfile(vim.fn.expand('/home/pampam/.config/nushell/pams_history.txt'))}, choose=function(p) vim.cmd.edit(vim.fn.fnameescape(vim.fn.expand(p))) end})<CR>",
	{ desc = "Pick frequent files", silent = true }
)

MiniPick.registry.files = function(local_opts)
	local opts = { source = { cwd = local_opts.cwd } }
	local_opts.cwd = nil
	return MiniPick.builtin.files(local_opts, opts)
end

map("n", "<leader>j", function()
	require("mini.pick").registry.files({
		cwd = vim.fn.expand("%:p:h"),
	})
end, { desc = "Pick files from buffer dir" })
-- }}}

-- 7) UI & Colors {{{
require("tokyonight").setup()
vim.cmd("colorscheme tokyonight")
vim.cmd(":hi statusline guibg=NONE")
-- }}}

-- 8) Neovide {{{
---@diagnostic disable-next-line: undefined-field
if vim.g.neovide then
	map({ "n", "v" }, "<M-u>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
		{ desc = "Increase font size", silent = true })
	map({ "n", "v" }, "<M-U>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
		{ desc = "Decrease font size", silent = true })
	map({ "n", "v" }, "<M-C-u>", ":lua vim.g.neovide_scale_factor = 1<CR>", { desc = "Reset font size", silent = true })
	map("c", "<C-S-v>", "<C-R>+", { desc = "Paste in command mode" })
end
vim.g.neovide_cursor_animation_length = 0.1
-- }}}

-- 9) Autocmds {{{
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
	end,
})
-- }}}
