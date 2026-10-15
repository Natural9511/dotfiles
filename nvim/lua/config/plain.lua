vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("FileType", {
	pattern = "json",
	callback = function()
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "cs",
	callback = function()
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.expandtab = true
	end,
})
