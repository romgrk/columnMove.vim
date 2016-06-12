"==============================================================================
" File: column-move.vim
" Author: romgrk
" Date: 08 Jun 2016
" Description: Move up&down until next/previous whitespace.
" !::exe [let g:columnMove_debug = 1 | So]
"==============================================================================
if exists('g:did_columnMove_loaded')
        \ && !exists('g:columnMove_debug')
    finish
end
let did_columnMove_loaded = 1


noremap <expr> <Plug>ColumnMoveUp   columnMove#UpMap()
noremap <expr> <Plug>ColumnMoveDown columnMove#DownMap()


function! s:columnMappings ()
    if (get(g:, 'columnMove_mappings', 1) == 0)
        return
    end

    nmap gk    <Plug>ColumnMoveUp
    nmap gj    <Plug>ColumnMoveDown
    vmap <A-k> <Plug>ColumnMoveUp
    vmap <A-j> <Plug>ColumnMoveDown
endfunc


if has('vim_starting')
    autocmd VimEnter * :call <SID>columnMappings()
else
    call <SID>columnMappings()
end


" End of File
