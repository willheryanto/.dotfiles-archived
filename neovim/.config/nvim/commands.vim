"""" Windows related
" Split below by default
set splitbelow
" Split right by default
set splitright

" tab mappings
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Switching tab
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" Resize window
nmap <C-w>h <C-w><
nmap <C-w>l <C-w>>
nmap <C-w>j <C-w>+
nmap <C-w>k <C-w>-

"""" Navigation
" Make sure that movements work as expected in wrapped lines
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> 0 g0
noremap <silent> ^ g^
noremap <silent> $ g$
noremap <silent> gj j
noremap <silent> gk k
noremap <silent> g0 0
noremap <silent> g^ ^
noremap <silent> g$ $

"""" Remap other keys so we keep functionality available
" Moving around faster
nmap J 5j
nmap K 5k
vmap J 5j
vmap K 5k
nmap H ^
nmap L $
vmap H ^
vmap L $

" Good command line history navigation
" C-n and C-p by default don't filter
" by mapping them to the arrow keys they do
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" Remap jumplist C-i because confilting with TAB for COC Snippet
nnoremap <C-u> <C-i>

" Re-enabling keyword search in nvim
nnoremap <Leader>k K
vnoremap <Leader>k K

" Since I remapped J and I still want to join stuff
nnoremap <Leader>j J
vnoremap <Leader>j J

" Test M as in Merge
nnoremap M J
vnoremap M J

" Keep s available
nnoremap <Leader>sl s

"""" NERDTree config
nnoremap <leader>n :NERDTreeFind<CR>

"""" Utils
" Add character to first and last
noremap <Leader>af :1,$s/^/
noremap <Leader>al :1,$s/$/

" Clear highlights
nnoremap <leader>/ :noh<CR>

" Quick save and quit
noremap <Leader>w :w<CR>
noremap <Leader>qq :q!<CR>
noremap <Leader>qa :quitall!<CR>
noremap Yy ^y$

nnoremap Q @@
