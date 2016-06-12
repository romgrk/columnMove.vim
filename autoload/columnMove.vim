"==============================================================================
" File: columnMove.vim
" Author: romgrk
" Date: 08 Jun 2016
" Description: here
" !::exe [match b_pink /@/ | So | so %:h:h/plugin/columnMove.vim]
"==============================================================================

" Avoid making stupid mistakes.
let s:UP   = -1
let s:DOWN = 1

" Boolean values
let s:false = 0
let s:true = 1

" Returns character at (lnum, colnum) (1-indexed)
function! s:charAt (lnum, colnum)
    return getline(a:lnum)[a:colnum - 1]
endfunc

" Builds a search pattern from the passed parameters
let s:placeholder = '@'
function! s:P (c, atoms)
    let subPatterns = copy(a:atoms)
    let subPatterns = map(subPatterns, 'printf("(%s)", v:val)')
    let pattern = '\v' . join(subPatterns, '|')
    let pattern = substitute(pattern, s:placeholder, a:c, 'g')
    return pattern
endfunc

" Returns the end-of-current or start-of-next vertical block boundary
function! columnMove#FindBoundary (direction)
    let direction = a:direction
    let startLine = line('.') "  search from cursor-line
    let col       = col('.')      " 1-based column number

    let pattern = s:P(col,
                \ ['%@c\S', '\S%@c\s'])
    let matchEnd = s:false

    let lnum = startLine + direction

    if (getline(lnum) =~# pattern)
        let pattern = s:P(col,
                    \ ['^.*$%<@c', '^\s*%@c\s', '%@c\s*$'])
        let matchEnd = s:true
    end

    while (lnum >= 0 && lnum <= line('$'))
        if (getline(lnum) =~# pattern)
            break
        end
        let lnum += direction
    endwhile

    if (matchEnd == s:true)
        let nextLine = lnum - direction
    else
        let nextLine = lnum
    end

    call s:log('char', s:charAt(startLine, col))
    call s:log('patt', pattern)
    call s:log('col', col)
    call s:log('startLine', startLine)
    call s:log('nextLine', nextLine)
    call s:log('nextChar', s:charAt(nextLine, col))

    return [nextLine, l:col]
endfunc

" Set cursor position to next boundary
function! columnMove#Cursor (direction)
    let [lnum, colnum] = columnMove#FindBoundary(a:direction)
    call cursor(lnum, colnum)
    return ''
endfunc

" Returns normal-keys to set cursor position to upper boundary
function! columnMove#UpMap ()
    return columnMove#Map(s:UP)
endfunc

" Returns normal-keys to set cursor position to lower boundary
function! columnMove#DownMap ()
    return columnMove#Map(s:DOWN)
endfunc

" Returns normal-keys to set cursor position to boundary in {dir} direction
function! columnMove#Map (dir, ...)
    let dir  = a:dir
    let mode = get(a:, 1, 'n')
    let [lnum, colnum] = columnMove#FindBoundary(dir)

    " if (mode ==# 'n') end
    let keys = printf("%igg%i|", lnum, colnum)
    call s:log('keys', keys)
    return keys
endfunc


" Inspection/debugging functions:

" Inspect current char and relative boundaries.
" function! columnMove#Debug (...)
    " let direction = a:dir
    " let lnum = line('.')  "  search from cursor-line
    " let colnum = col('.') " 1-based column number
    " let [nextLine, nextCol] = columnMove#FindBoundary(direction)
    " call s:log('keys', columnMove#Map(direction))
" endfunc

" Log & label
function! s:log (label, ...)
    if !get(g:, 'columnMove_debug', 0)
        return | end

    if !empty(a:label) && type(a:label) == 1
        echohl Label
        echon a:label . ': '
    end

    let type_hl = ['Number', 'String', 'Function',
                \ 'Number', 'Dict', 'Float',
                \ 'Boolean', 'Null' ]

    for value in a:000
        execute 'echohl ' . type_hl[type(value)]
        if type(value) == 1
            echon value
        else
            echon string(value) | end
        " elseif type(value) == 3
            " call call(<SID>log, [0] + value)

        if (value != a:000[-1])
            echohl Delimiter
            echon ', '
        else
            echon ' ' | end
    endfor

    echohl None
endfunc

