# ColumnMove
============

Move to the end/start of vertical block.

 - If the cursor is on a whitespace and/or virtual-column, moves to the next character in column that matches `'\S'` (any non-whitespace).
 - If the cursor is on a non-whitespace character, moves to the last character in column that matches `'\S'` before a `'^$'` (empty) match is found.



Usage: (default mappings)

```viml
nmap gk    <Plug>ColumnMoveUp
nmap gj    <Plug>ColumnMoveDown
xmap <A-k> <Plug>ColumnMoveUp
xmap <A-j> <Plug>ColumnMoveDown
```


Consider the following text, with cursor at `[x]`; repeatedly pressing
`<Plug>ColumnMoveDown` would take you to the marked positions.
```viml
" .......     ........ [x]...........................
"
" ......................1............................
" ...................................................
" ......................2............................
"
" ...................
"  .......   ........   3....
" .... ..    .... ..    ..................
" .... ..    .... ..    4...................
" .... ..
" .... ..
" .... ..
" .... ..... .... ..... 5.................
" .... ..... .... ..... ....................
"                       ....................
"                       6...................
"EOF
```

Here is a low-quality screencast:

![alt text](./demo.gif "")


### Other

```viml
let did_columnMove_loaded = 1 " Disable plugin:
let columnMove_mappings = 0   " Disable default mappings:
```

## License

JSON

## Credits

[Learn Vimscript the Hard Way][1] (eternal thanks to Steve Losh)

[1](http://learnvimscriptthehardway.stevelosh.com/)

