-- Keymaps: all mappings live here

local map = vim.keymap.set


-- Tabs and terminal
map("n", "<M-]>", ":tabnext<CR>", { noremap = true, silent = true })
map("n", "<M-[>", ":tabprevious<CR>", { noremap = true, silent = true })
map("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })
-- map("n", "<C-w><C-e>", ":!shpool detach<CR>", { noremap = true, silent = true })
map("t", "<S-Esc>", [[<C-\><C-n>]])


-- map this function require("copilot.suggestion").accept(modifier)
map("i", "<M-k>", function()
    return require("copilot.suggestion").accept("word")
end, { expr = true, silent = true, desc = "Copilot: Accept suggestion" })



-- Messages scratch buffer
map('n', '<leader>n',
    "<cmd>new | setlocal buftype=nofile bufhidden=wipe noswapfile | 0put =execute('silent messages')<CR>",
    { silent = true, desc = 'Open :messages in scratch buffer' }
)
map("n", "<leader>bd", ":bd<CR>", { desc = "Close buffer" })

-- Copy parent directory of current file
map("n", "<C-z>", function()
    local parent_dir = vim.fn.expand("%:p:h")
    vim.fn.setreg("+", parent_dir)
    vim.notify("Copied: " .. parent_dir)
    vim.cmd("cd " .. vim.fn.fnameescape(parent_dir))
end, { desc = "Copy parent directory of current file" })

-- Quality of life
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>o", ":update<CR> :source<CR>", { desc = "Write + Source init.lua" })
map("n", "<leader>;", vim.lsp.buf.format, { desc = "LSP: Format buffer" })
map("n", "L", ":b#<CR>", { desc = "Alternate buffer", noremap = true, silent = true })
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true, desc = 'Clear search highlight' })
map("n", "<C-a>", ":%y<CR>", { noremap = true, silent = true, desc = "Yank entire buffer" })
map('n', '<C-Tab>', 'za', { desc = 'Toggle fold (was: open)' })
map('n', 'gs', ':se spell<CR>', { silent = true })

-- Sessions
map("n", "<C-e>", function()
    local session = vim.fn.expand("~/.local/share/nvim-hanni/session.vim")
    vim.cmd("source " .. session)
end, { desc = "Restore last session" })

-- Plugins: commands and helpers
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo tree" })
map("n", "<M-j>", ":Yazi<CR>", { desc = "Open Yazi" })
map("n", "<leader>t", ":lua require('toggle-checkbox').toggle()<CR>", { silent = true, desc = "Toggle CheckBox" })
map("n", "<leader>l", ":LazyGit<CR>", { silent = true })

-- Flash.nvim
do
    local ok, flash = pcall(require, 'flash')
    if ok then
        map({ "n", "x", "o" }, "s", function() flash.jump() end, { desc = "Flash" })
        map({ "n", "x", "o" }, "S", function() flash.treesitter({ labels = "jkluiohprewtfsgvmcbq" }) end,
            { desc = "Flash Treesitter" })
    end
end

-- Pickers & Search (mini.pick)
map("n", "<leader>k", ":Pick files<CR>", { desc = "Pick files" })
map("n", "<leader>h", ":Pick help<CR>", { desc = "Pick help" })
map("n", "<M-l>", ":Pick buffers<CR>", { desc = "Pick buffers" })
map("n", "<leader>g", ":Pick grep<CR>", { desc = "Pick grep" })
map("n", "<leader>r", ":Pick registers<CR>", { desc = "Pick registers" })

-- Frequent files from Nushell history
map("n", "<M-k>", function()
    local items = vim.fn.readfile(vim.fn.expand('~/.config/nushell/pams_history.txt'))
    require('mini.pick').start({
        source = { items = items },
        choose = function(p)
            vim.cmd.edit(vim.fn.fnameescape(vim.fn.expand(p)))
        end,
    })
end, { desc = "Pick frequent files", silent = true })

map("n", "<leader>j", function()
    require("mini.pick").registry.files({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Pick files from buffer dir" })

-- Multicursor (safe require)
do
    local ok, mc = pcall(require, 'multicursor-nvim')
    if ok then
        -- Layered keymap controls from plugin API
        mc.addKeymapLayer(function(layerSet)
            layerSet({ "n", "x" }, "<left>", mc.prevCursor)
            layerSet({ "n", "x" }, "<right>", mc.nextCursor)
            layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)
            layerSet("n", "<M-esc>", function()
                if not mc.cursorsEnabled() then mc.enableCursors() else mc.clearCursors() end
            end)
        end)

        -- Standard mappings using the module
        map('x', 'I', function() mc.insertVisual() end, { silent = true, desc = 'MC: Insert at starts' })
        map('x', 'A', function() mc.appendVisual() end, { silent = true, desc = 'MC: Append at ends' })
        map({ 'n', 'x' }, '<leader>m', function() mc.matchAddCursor(1) end, { silent = true, desc = 'MC: Match add' })
        map({ 'n', 'x' }, '<Up>', function() mc.lineAddCursor(-1) end, { silent = true, desc = 'MC: Add above' })
        map({ 'n', 'x' }, '<Down>', function() mc.lineAddCursor(1) end, { silent = true, desc = 'MC: Add below' })
        map({ 'n', 'x' }, 'g<C-a>', function() mc.sequenceIncrement() end, { silent = true, desc = 'MC: Seq ++' })
        map({ 'n', 'x' }, 'g<C-x>', function() mc.sequenceDecrement() end, { silent = true, desc = 'MC: Seq --' })
        map({ 'n', 'x' }, '<c-q>', function() mc.toggleCursor() end, { desc = 'Multicursor: Toggle Cursors' })
        map({ 'n', 'x' }, 'gl', function() mc.restoreCursors() end, { desc = 'Multicursor: Restore Cursors' })
        map({ 'n', 'x' }, 'M', function() mc.matchCursors() end)
    end
end

-- Neovide-specific keymaps
if vim.g.neovide then
    map({ "n", "v" }, "<M-u>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
        { desc = "Increase font size", silent = true })
    map({ "n", "v" }, "<M-U>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
        { desc = "Decrease font size", silent = true })
    map({ "n", "v" }, "<M-C-u>", ":lua vim.g.neovide_scale_factor = 1<CR>", { desc = "Reset font size", silent = true })
    map("c", "<C-S-v>", "<C-R>+", { desc = "Paste in command mode" })
end
-- vim.keymap.del("n", "<C-f>")
-- vim.keymap.del("n", "<C-w><C-e>")

-- Copilot
map("n", "<leader>c", function()
    require("copilot.suggestion").toggle_auto_trigger()
end, { silent = true, desc = "Copilot: Accept suggestion" })
