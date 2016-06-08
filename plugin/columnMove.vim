"==============================================================================
" File: column-move.vim
" Author: romgrk
" Date: 08 Jun 2016
" Description: Move up&down until next/previous whitespace.
" !::exe [let g:columnMove_debug = 1 | So]
"==============================================================================
if exists('did_columnMove_init')
        \ && !exists('columnMove_debug')
    finish
end
let did_columnMove_init = 1

noremap <expr> <Plug>ColumnMoveUp   columnMove#UpMap()
noremap <expr> <Plug>ColumnMoveDown columnMove#DownMap()

if !exists('g:columnMove_mappings')
        \ || get(g:, 'columnMove_mappings', 1)==1
    nmap gk    <Plug>ColumnMoveUp
    nmap gj    <Plug>ColumnMoveDown
    xmap <A-k> <Plug>ColumnMoveUp
    xmap <A-j> <Plug>ColumnMoveDown
end

if exists('columnMove_debug')
    nmap <leader>d :call columnMove#Debug()<CR>
end
