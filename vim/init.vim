set number
hi Normal guibg=NONE



"function Format()
"	let line = getline(".")
"	let count = len(line)
"	let star = repeat("#",count+10)
"
"	let lines = "###  " .. line .. "  ###"
"	let list = [star,lines,star]
"	return list
"endfunction
"
"
"map ,, :execute "normal O" .. Format()[0]<CR>j:execute "normal o" .. Format()[2]<CR>k:execute "normal S" .. Format()[1]<CR>j

"function Format()
"	let line = getline(".")
"	let count = len(line)
"	let star = repeat("#",count+10)
"
"	let lines = "###  " .. line .. "  ###"
"	let list = [star,lines,star]
"	return list
"endfunction
"
"
"function ExecFormat()
"	execute "normal O" .. Format()[0]
"	execute "normal j" 
"	execute "normal o" .. Format()[2]
"	execute "normal k" 
"	execute "normal S" .. Format()[1]
"	execute "normal j"
"endfunction
"
"
"map ,, :call ExecFormat()<CR>


function Format()
	let line = getline(".")
	let count = len(line)
	let star = repeat("#",count+10)

	let lines = "###  " .. line .. "  ###"
	let list = [star,lines,star]
	return list
endfunction


function ExecFormat(listFormat)
	execute "normal O" .. a:listFormat[0]
	execute "normal j" 
	execute "normal o" .. a:listFormat[2]
	execute "normal k" 
	execute "normal S" .. a:listFormat[1]
	execute "normal j"
endfunction


map ,, :let lists=Format()<CR>:call ExecFormat(lists)<CR>

