# ColumnMove
===================

Move to the end/start of vertical block.

Usage: (No default mappings)

```viml
omap p  <Plug>(operator-lhs)
omap P  <Plug>(operator-Lhs)
omap v  <Plug>(operator-rhs)
omap V  <Plug>(operator-Rhs)
```

```viml
vmap =h <Plug>(visual-lhs)
vmap =l <Plug>(visual-rhs)
vmap =H <Plug>(visual-Lhs)
vmap =L <Plug>(visual-Rhs)
```

## Demo:

```javascript
let dict['value and = signs and colons :: '] = [ 45 ];
```

## License

Same as JSON, as long as I'm concerned, 
but most of the code here is freely adapted from
[Learn Vimscript the Hard Way][1] (eternal thanks to Steve Losh)

[1](http://learnvimscriptthehardway.stevelosh.com/)

<!--![alt text](./pp_self2.png "")-->

