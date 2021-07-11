" Disable plugin mappings
let g:swoopUseDefaultKeyMap = 0
let g:gitgutter_map_keys = 0
let g:dispatch_no_maps = 1

" Leader mappings {{{
" Leader is <Space>
let g:mapleader=' '
let g:maplocalleader = ','
call which_key#register('<Space>', "g:leader_key_map")

let g:leader_key_map=  {}

let g:leader_key_map.c = {
      \ 'name': '+cscope',
      \ 's': [':cs find s <cword>', 'Cscope Symbol'],
      \ 'g': [':cs find g <cword>', 'Cscope Definition'],
      \ 'c': [':cs find c <cword>', 'Cscope Callers'],
      \ 'd': [':cs find d <cword>', 'Cscope Callees'],
      \ 'a': [':cs find a <cword>', 'Cscope Assignments'],
      \ 'o': [':cs add cscope.out', 'Cscope Open Database'],
      \
      \ 'z': [':!sh -xc ''starscope -e cscope -e ctags''', 'Cscope Build Database'],
      \ }


" g mappings {{{

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(LiveEasyAlign)

