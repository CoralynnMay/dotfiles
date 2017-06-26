set number

function TrimAll()
    let save_cursor = getpos(".")
    :%s/\s\+$//e
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

autocmd BufWritePre * :TrimAll()
