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
" [.]..... ... ....... [.].... ... ...        [ ]
"
" .1....................1......................1..
" ..........................................
" .2....................2......................2..
"
"      .............
"      ...   .......  ..3....
" .3.. ..    .... ..  ....................
" .... ..    .... ..  ..4.................
" .... ..
" .... ..
" .... ..
" .... ..... ....       5.................
" .4.. ..... ....       ...................  ..3..
"
"                       6..................
"  5                    7                      4
EOF
```

Here is a low-quality screencast:

![alt text](./demo.gif "")

### Issues

Untested and not intended for use with `set wrap`.

Doesn't (currently) work with tabs and fancy double-width characters.

### Other

```viml
let did_columnMove_loaded = 1 " Disable plugin:
let columnMove_mappings = 0   " Disable default mappings:
```

## License

JSON

## Credits

[Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/) (eternal thanks to Steve Losh)

