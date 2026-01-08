local wins = vim.api.nvim_list_wins()

iter = vim.iter(wins)
tt = iter:map(function (win)
	return vim.api.nvim_win_get_buf(win)
end):totable()


for i, v in ipairs(tt) do
	print(i,'for',v)
end

ls = vim.bo.buftype

print(ls,'ls')

print(vim.o.filetype)
