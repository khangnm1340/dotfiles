local pdf = vim.fn.expand("%:r") .. ".pdf"
vim.keymap.set("n", "gl", function()
  vim.cmd("LspTinymistExportPdf")
	vim.fn.jobstart({ "xdg-open", pdf }, { detach = true })
end, { silent = true })
-- vim.keymap.set("n", "gl", ":LspTinymistExportPdf<CR>", { silent = true })
vim.cmd([[
	setlocal wrapmargin=0
	setlocal formatoptions+=t
	setlocal linebreak
	setlocal wrap
]])
