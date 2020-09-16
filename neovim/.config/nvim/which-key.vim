"""" Which-key
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '?'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

" f is for format
let g:which_key_map.f = {
      \ 'name' : '+format' ,
      \ 'o' : [':Format'        , 'format using auto coc'],
      \ 'e' : [':CocCommand eslint.executeAutofix', 'format using eslint']
      \ }

" l is for coc
let g:which_key_map.l = {
      \ 'name' : '+coc-commands' ,
      \ 'a' : [':CocList diagnostics'        , 'show all diagnostics'],
      \ 'e' : [':CocList extensions', 'manage extensions'],
      \ 'c' : [':CocList commands', 'show commands'],
      \ 'o' : [':CocList outline', 'find symbol of current document'],
      \ 's' : [':CocList -I symbols', 'search worskspace symbol'],
      \ 'j' : [':CocNext', 'do default action for next item'],
      \ 'k' : [':CocPrev', 'do default action for prev item'],
      \ 'p' : [':CocListResume', 'resume latest coc list'],
      \ 'q' : ['<Plug>(coc-fix-current)', 'coc quick fix']
      \ }

" t is for terminal
"let g:which_key_map.t = {
      "\ 'name' : '+terminal' ,
      "\ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      "\ 'g' : [':FloatermNew lazygit'                           , 'git'],
      "\ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      "\ 'n' : [':FloatermNew node'                              , 'node'],
      "\ 'p' : [':FloatermNew python'                            , 'python'],
      "\ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+diff get' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Gcommit'                          , 'commit'],
      \ 'd' : [':Gdiff'                            , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ 'w' : [':GWrite'                           , 'git write current file'],
      \ 'g' : {
        \ 'name': '+git',
        \ '2' : [':diffget //2'                      , 'diff get 2'],
        \ '3' : [':diffget //3'                      , 'diff get 3'],
        \ },
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
