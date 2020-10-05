if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

"""base"""
set backupcopy=yes
set expandtab
set formatoptions-=cro
set guicursor=
set hidden
set incsearch
set mouse=
set nobackup
set noerrorbells
set nohlsearch
set noshowmatch
set noshowmode
set noswapfile
set nowrap
set nu
set relativenumber
set scrolloff=8
set shiftwidth=2
set smartcase
set smartindent
set splitbelow
set splitright
set tabstop=2 softtabstop=2
set termguicolors
set undodir=~/.config/nvim/undodir
set undofile
set clipboard=unnamedplus

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

syntax on

let loaded_matchparen = 1

let mapleader = " "

" Map escape
inoremap jf <esc>

" match escape for terminal as well
tnoremap <silent> jf <C-\><C-n>

" Line mappings
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Rainbow parens
let g:rainbow_active = 1

" Enable ripgrep if available
if executable('rg')
  let g:rg_derive_root='true'
endif

" nerd commenter
let g:NERDSpaceDelims = 1

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Remember last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  au BufWritePre * :call TrimWhitespace()

  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
  augroup END

  au BufNewFile,BufRead *.gohtml set syntax=gohtmltmpl
endif

"""coc"""

" CocExtensions
let g:coc_global_extensions = [
\ 'coc-css',
\ 'coc-emmet',
\ 'coc-eslint',
\ 'coc-explorer',
\ 'coc-go',
\ 'coc-html',
\ 'coc-json',
\ 'coc-lua',
\ 'coc-marketplace',
\ 'coc-prettier',
\ 'coc-project',
\ 'coc-python',
\ 'coc-rls',
\ 'coc-rust-analyzer',
\ 'coc-snippets',
\ 'coc-tailwindcss',
\ 'coc-tsserver',
\ 'coc-ultisnips',
\ 'coc-yaml'
\ ]

" base mappings
inoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart<CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>pl :CocList project<CR>

" coc-explorer
nnoremap <leader>e :CocCommand explorer<CR>

"""colors"""
set colorcolumn=81
highlight ColorColumn ctermbg=0 guibg=cyan
silent! colorscheme gruvbox
set background=dark

"""fzf"""
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.5,  'yoffset': 0 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4"
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor,dist,build}/*"'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"""leader mappings"""
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>pp :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>fr :Buffers<CR>
nnoremap <Leader>fs :w<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader><Leader> :e ~/.config/nvim/init.vim<CR>

" Tabs
nnoremap <Leader>tt :tabnew <bar> terminal<CR>
nnoremap <Leader>tq :tabclose<CR>

" Buffers mappings
nnoremap <Leader><tab> :b#<CR>
nnoremap <Leader>bq :bd!<CR>

" Fugitive
nmap <Leader>gp :Gpush origin<space>
nmap <Leader>gl :Gpull origin<space>
nmap <Leader>gco :Git checkout<space>
nmap <Leader>gcm :Git checkout master<CR>
nmap <Leader>gs :Gstatus<CR>

" Merginal
nmap <Leader>gm :MerginalToggle<CR>

" custom files
nnoremap <Leader>nw :e ~/Dropbox/work_notes<CR>

"""indent guide"""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
