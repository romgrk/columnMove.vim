"==============================================================================
" File: columnMove.vim
" Author: romgrk
" Date: 08 Jun 2016
" Description: here
" !::exe [So]
"==============================================================================

" Avoid making stupid mistakes.
let s:UP   = -1
let s:DOWN = 1

" Returns character at (lnum, colnum) (1-indexed)
function! s:charAt (lnum, colnum)
    return getline(a:lnum)[a:colnum - 1]
endfunc


" Returns the end-of-current or start-of-next vertical block boundary
function! columnMove#FindBoundary (direction, ...)
    let direction = a:direction
    let lnum = get(a:000, 1, line('.')) "  search from cursor-line
    let colnum = col('.')      " 1-based column number

    let matchAtEnd = v:false
    let pattern = '\v\S'

    let lnum = lnum + direction

    if (s:charAt(lnum, colnum) =~# '\v\S')
        let pattern = '\v^$'
        let matchAtEnd = v:true
    end

    while (lnum >= 0 && lnum <= line('$'))
        if (s:charAt(lnum, colnum) =~# pattern)
            break
        end
        let lnum += direction
    endwhile

    if (matchAtEnd == v:true)
        return [lnum - direction, colnum]
    else
        return [lnum, colnum]
    end
endfunc

" Set cursor position to next boundary
function! columnMove#Cursor (direction)
    let [lnum, colnum] = columnMove#FindBoundary(a:direction)
    call cursor(lnum, colnum)
    return ''
endfunc

" Returns normal-keys to set cursor position to upper boundary
function! columnMove#UpMap ()
    let [lnum, colnum] = columnMove#FindBoundary(s:UP)
    return (line('.') - lnum) . 'k'
endfunc

" Returns normal-keys to set cursor position to lower boundary
function! columnMove#DownMap ()
    let [lnum, colnum] = columnMove#FindBoundary(s:DOWN)
    return (lnum - line('.')) . 'j'
endfunc



" Inspection/debugging functions:

" Inspect current char and relative boundaries.
function! columnMove#Debug ()
    let lnum = line('.')  "  search from cursor-line
    let colnum = col('.') " 1-based column number
    let pattern = '\v\S'
    if (s:charAt(lnum, colnum) =~# '\v\S')
        let pattern = '\v^$'
    end

    call s:log('pos', line('.'), col('.'))
    call s:log('char', s:charAt(lnum, colnum))
    call s:log('patt', pattern)

    echo ''

    call s:log('upMap', columnMove#FindBoundary(s:UP)[0], columnMove#UpMap())
    call s:log('downMap', columnMove#FindBoundary(s:DOWN)[0], columnMove#DownMap())
endfunc

" Log & label
function! s:log (label, ...)
    echohl Label
    echon a:label . ': '

    let types = ['Number', 'String', 'Function',
                \ 'List', 'Dict', 'Float',
                \ 'Boolean', 'Null' ]

    for value in a:000
        execute 'echohl ' . types[type(value)]
        echon string(value) . ((value != a:000[-1]) ? ', ' : ' ')
    endfor

    echohl None
endfunc


