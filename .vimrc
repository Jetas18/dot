" Plugin Loading
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' 
Plug 'mbbill/undotree' 
Plug 'plasticboy/vim-markdown' 
Plug 'wakatime/vim-wakatime' 
Plug 'ryanoasis/vim-devicons' 
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug '907th/vim-auto-save' 
Plug 'rhysd/vim-clang-format'
Plug 'sheerun/vim-polyglot'

Plug 'ziglang/zig.vim' 

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'github/copilot.vim'
"vim airline
" Plug 'vim-airline/vim-airline'

Plug 'raimondi/delimitmate'

Plug 'scrooloose/syntastic'

Plug 'scrooloose/nerdtree'

Plug 'easymotion/vim-easymotion'

Plug 'joshdick/onedark.vim'
call plug#end()


" Helo
" Startup Settings

syntax on
let mapleader=" "
let NERDTreeShowHidden=1
" let g:auto_save = 1
" let g:auto_save_events = ["InsertLeave", "TextChanged"]
let $FZF_DEFAULT_COMMAND = 'fdfind --type f --hidden --follow --exclude .git --ignore-file ~/.ignore'
set mouse=a 
set cursorline
highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
set noerrorbells
set splitbelow splitright
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nofoldenable
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set history=100
set nocompatible
set number relativenumber
set background=dark
set termguicolors
filetype plugin on
set encoding=utf-8
set wildmenu
set wildmode=longest,list,full
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set spell spelllang=en_us
set clipboard=unnamedplus
set clipboard+=unnamed
" Plugin Shortcuts
colorscheme onedark
set scrolloff=4



nnoremap <F5> :UndotreeToggle<CR> :UndotreeFocus<CR>
nnoremap <C-f> :Files!<CR>
" nnoremap <Leader>l :Tabularize /


imap <C-l> <Plug>(coc-snippets-expand)

" nmap p "+p 
nmap y "+y


set nowrap

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)



let g:EasyMotion_startofline = 0 " keep cursor column when JK motion


augroup AutoClangFormat
    autocmd!
    autocmd BufEnter *.{c,cpp,cc} :ClangFormatAutoEnable
    autocmd BufEnter * :ClangFormatAutoDisable
augroup END


map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)


map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

nnoremap <C-s> :w<CR>

nmap s <Plug>(easymotion-overwin-f2)

" General Shortcuts
nnoremap S :%s//g<Left><Left> 
nmap <Leader>r :w<CR>:so %<CR>
map <Leader>e $

" Persistent_undo
set undodir=~/.vim/undodir"
set undofile
let g:undotree_WindowLayout = 2





" Tabedit keybinds
nnoremap <Leader>1 1gt<CR>
nnoremap <Leader>2 2gt<CR>
nnoremap <Leader>3 3gt<CR>
nnoremap <Leader>4 4gt<CR>
nnoremap <Leader>5 5gt<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>c :tabclose<CR>

" Enable NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

let g:coc_global_extensions = ['coc-snippets', 'coc-clangd', 'coc-json', 'coc-zig']

" Coc keybinds

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Markdown Edits
let g:vim_markdown_autowrite = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0

" Markdown auto format tables
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" transparent bg
" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

set sidescrolloff=10
