"""""""""""""""""""""""""""""""""""""""""""
" _   _             __      ___           "
"| \ | |            \ \    / (_)          "
"|  \| | ___  ___    \ \  / / _ _ __ ___  "
"| . ` |/ _ \/ _ \    \ \/ / | | '_ ` _ \ "
"| |\  |  __/ (_) |    \  /  | | | | | | |"
"|_| \_|\___|\___/      \/   |_|_| |_| |_|"
"                                         "
"""""""""""""""""""""""""""""""""""""""""""
                                         
"if empty(glob("~/.vim/autoload/plug.vim"))
"	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"	autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
"endif
set shell=/bin/bash
call plug#begin('~/.vim/plugged')

" Plugin manager
Plug 'junegunn/vim-plug'

" Nvim enhancements
Plug 'ciaranm/securemodelines'
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'jceb/vim-orgmode'

" Themes
"Plug 'nanotech/jellybeans.vim'
"Plug 'morhetz/gruvbox'
"Plug 'srcery-colors/srcery-vim'
"Plug 'fortes/vim-escuro'
"Plug 'balanceiskey/vim-framer-syntax'
"Plug 'joshdick/onedark.vim'
"Plug 'rakr/vim-one'

" GUI enhancements
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'machakann/vim-highlightedyank'
"Plug 'jceb/blinds.nvim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'rstacruz/vim-closer'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'

" Ctag support
Plug 'majutsushi/tagbar'

" Semantic language support
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'

" Completion
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'

" Linter
"Plug 'dense-analysis/ale'
Plug 'vim-syntastic/syntastic'

" Use :Nyancat or :Nyancat2
Plug 'koron/nyancat-vim'

call plug#end()

" =============================================================================
" # GUI settings
" =============================================================================
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set showtabline=2
set nofoldenable
set number
set relativenumber
set splitright
set splitbelow
set mouse=a

" deal with colors
if !has('gui_running')
  set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif

" Base16
let base16colorspace=256
let g:base16_shell_path="~/chris/base16-builder-rust/templates/shell/scripts"

set background=dark
colorscheme base16-gruvbox-dark-hard
hi Normal ctermbg=NONE
syntax on

set cursorline
let g:blinds_guibd = "#303030"

highlight clear lineNr

" Rainbow parentheses activation based on file type
augroup rainbow_rust
  autocmd!
  autocmd FileType rust,toml RainbowParentheses
augroup END

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" =============================================================================
" # Airline settings
" =============================================================================
set showtabline=2
"set laststatus=2
" Disables default mode display
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" =============================================================================
" # Bufferline settings
" =============================================================================
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" =============================================================================
" # Netrw settings
" =============================================================================
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 10
let g:netrw_browse_split = 2

" =============================================================================
" # Secure modelines
" =============================================================================
let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",  "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",  "noreadonly", "noro",
                \ "rightleft",   "rl",  "norightleft", "norl",
                \ "colorcolumn"
                \ ]

" =============================================================================
" # NCM2 settings
" =============================================================================
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
"
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" =============================================================================
" # CoC settings
" =============================================================================

" =============================================================================
" # Rust formatting
" =============================================================================
let g:rustfmt_command = "rustfmt +nightly"
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"

" =============================================================================
" # Rust linter
" =============================================================================
let g:ale_enabled = 1
let g:ale_completion_enabled = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_virtualtext_cursor = 1
let g:ale_rust_rls_config = {
	\ 'rust': {
		\ 'all_targets': 1,
		\ 'build_on_save': 1,
		\ 'clippy_preference': 'on'
	\ }
	\ }
let g:ale_rust_rls_toolchain = 'nightly'
let g:ale_linters = {'rust': ['rls']}

highlight link ALEWarningSign Todo
highlight link ALEErrorSign WarningMsg
highlight link ALEVirtualTextWarning Todo
highlight link ALEVirtualTextInfo Todo
highlight link AleVirtualTextError WarningMsg
highlight ALEError guibg=None
highlight ALEWarning guibg=None

" =============================================================================
" # Universal Ctags for Rust
" =============================================================================
let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }
" =============================================================================
" # Tab settings
" =============================================================================
if has("autocmd")
	filetype plugin indent on
	autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" =============================================================================
" # Misc
" =============================================================================
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

set incsearch
set ignorecase
set smartcase
set gdefault
set undodir=~/.vimdid
set undofile
set nocompatible

let g:ctrlp_map = '<leader><leader>'
let g:ctrlp_cmd = 'CtrlPMixed'

tnoremap <Esc> <C-\><C-N>
nmap <Leader>tv :vnew term://bash<CR>
nmap <Leader>th :sp term://bash<CR>

nmap <Leader>s <Plug>(easymotion-s)
nmap <leader>w <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

nmap <leader>u :UndotreeToggle<CR>

nmap <leader>b :Buffers<CR>
nmap <leader>c :TagbarToggle<CR>

map H ^
map L $

" https://vi.stackexchange.com/a/2092 
nnoremap <leader>sv :vsp /tmp/scratch<CR>
nnoremap <leader>so :vsp /tmp/scratch.org<CR>

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
