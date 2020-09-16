" set leader to Space
let mapleader="\<Space>"

"""" Plugins
call plug#begin()

"" Project management
Plug 'mhinz/vim-startify'

"" File explorer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeFind' } " Explorer
Plug 'tpope/vim-unimpaired' " Pairs of handy bracket mappings
Plug 'ryanoasis/vim-devicons' " Icons!

"" Windows utils
Plug 'christoomey/vim-tmux-navigator' " Better integration with tmux
Plug 'voldikss/vim-floaterm' " Terminal popup window

"" Search utils
Plug 'wellle/targets.vim' " Target object from far away
Plug 'justinmk/vim-sneak' " Faster movement using find by 2 characters
Plug 'junegunn/fzf' " Pre-req for fzf.vim
Plug 'junegunn/fzf.vim' " Fuzzy file finder
Plug 'mhinz/vim-grepper' " Grep for vim

"" Text utils
Plug 'tpope/vim-surround' " Quoting parenthesing made simple
Plug 'scrooloose/nerdcommenter' " Enable quick comment toggle
Plug 'alvan/vim-closetag' " Auto close tag
Plug 'Raimondi/delimitMate' " Auto close quotes, parens, etc
Plug 'Yggdroot/indentLine' " Indent line

"" Vim basics
Plug 'tpope/vim-sensible' " Default behaviour for vim
Plug 'tpope/vim-eunuch' " Unix utils
Plug 'tpope/vim-repeat' " Enable repeating supported plugin maps with .
Plug 'liuchengxu/vim-which-key' " Which key

"" Git utils
Plug 'Xuyuanp/nerdtree-git-plugin' " NERDTree git integration
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'junegunn/gv.vim' " Git commit browser
Plug 'tpope/vim-rhubarb' " Open specific git file in browser

"" Customize UI
Plug 'itchyny/lightline.vim' " Custom status line

"" Themes
Plug 'sainnhe/gruvbox-material'
Plug 'haishanh/night-owl.vim'

"" Autocomplete
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " Language server
Plug 'mattn/emmet-vim' " Emmet

"" Syntax Support
Plug 'pangloss/vim-javascript' " Javascript
Plug 'mxw/vim-jsx' " JSX
Plug 'HerringtonDarkholme/yats.vim' " Typescript
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Python
Plug 'rust-lang/rust.vim' " Rust
Plug 'cespare/vim-toml' " TOML
Plug 'godlygeek/tabular' " Pre-req for vim-markdown
Plug 'plasticboy/vim-markdown' " Markdown
Plug 'mechatroner/rainbow_csv' " CSV

"" Snippets
Plug 'xabikos/vscode-javascript' " ES6 Javascript

"" Writing tools
Plug 'reedes/vim-pencil' " Awesome writing tool
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " Preview markdown in browser

"" Debugger
"Plug 'puremourning/vimspector' " Multi language debugging system

call plug#end()

" Plug simpler command
command! PInstall source $MYVIMRC | PlugInstall
command! PUpdate source $MYVIMRC | PlugUpdate
command! PClean source $MYVIMRC | PlugClean

"""" Starfify
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1

"""" Coc
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-snippets'
  \ ]

"""" NERDTree
let g:NERDTreeQuitOnOpen = 1 " Auto close nerd tree
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1

"""" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"

"""" FZF - bind file fuzzy search to C-p
nnoremap <C-p> :<C-u>FZF<CR>

"""" Floaterm
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_prev   = '<F2>'
let g:floaterm_keymap_next   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_autoclose=1

"""" Grepper
let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
nnoremap <Leader>rg :Grepper -tool rg<CR>

"""" Vim Pencil Setup
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init() | let g:indentLine_setConceal = 0
  autocmd FileType text call pencil#init() | let g:indentLine_setConceal = 0
  autocmd FileType json         let g:indentLine_setConceal = 0
augroup END

"""" Color scheme
if has("termguicolors")
 set termguicolors
endif

set background=dark
let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material

" Color scheme for lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status',
      \   'wordcount': 'WordCount'
      \ },
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

source $MYVIMCONFIG/coc-config.vim
source $MYVIMCONFIG/commands.vim
source $MYVIMCONFIG/markdown-preview-config.vim
source $MYVIMCONFIG/basic.vim
source $MYVIMCONFIG/which-key.vim
