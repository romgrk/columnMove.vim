# ColumnMove

Move to the end/start of vertical block (the cursor staying on the same column).

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
" [x]..... ... ....... [x].... ... ...        [x]
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

![alt text](https://raw.githubusercontent.com/romgrk/columnMove.vim/master/demo.gif "")

### Issues

Untested and not intended for use with `set wrap`.
Doesn't (currently) work with tabs and fancy double-width characters.
Make some noise (or a PR) if you're interested in having those implemented.

### Other

```viml
let columnMove_mappings = 0   " Disable default mappings:
```

## License

Released under the JSON License.

## Credits

[Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/) (eternal thanks to Steve Losh)


## Alternatives

 - [vim-vertical-move](https://github.com/vim-utils/vim-vertical-move)
