""""""
" Basic
""""""
set sw=4
set ts=4
set et
set smarttab
set smartindent
set lbr
set fo+=mB
set sm
set selection=inclusive
set selectmode=mouse,key
set wildmenu
set mousemodel=popup
set nocompatible
"set cul
set shortmess=atI
autocmd InsertEnter * se cul
syntax on
set ruler
set showcmd
set cmdheight=2
set viminfo+=!
set iskeyword+=_,$,@,%,#,-

""""""
" Background
""""""
"
"color desert
"color ron
"color torte
color rainbow_breeze

""""""
" Display CN help
""""""
if version >= 603
  set langmenu=zh_CN.UTF-8
  set helplang=cn
endif

""""""
" Indent
""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set expandtab

""""""
" Highlight search
""""""
set ignorecase
set incsearch
set hlsearch

""""""
" Save file as root
""""""
cnoremap sudow w !sudo tee % >/dev/null

""""""
" Code folding
""""""
set foldenable
"set foldcolumn=0
"set foldmethod=manual
set foldmethod=indent
"set foldlevel=3
"set foldclose=all
" Don't fold by default
set foldlevelstart=99
":nnoremap <space> za
noremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


""""""
" Misc
""""""
set noeb
set magic
set autoread
set autowrite
set confirm
set showmatch
set matchtime=1
set scrolloff=2
"set completeopt=preview,menu
set completeopt=longest,menu
set linespace=0
set backspace=2
set fillchars=vert:\ ,stl:\ ,stlnc:\
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
set nocscopeverbose

""""""
" Bundles
""""""
" Runtime path
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'wincent/command-t'
Plugin 'kien/ctrlp.vim'
Plugin 'jasoncodes/ctrlp-modified.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'Yggdroot/indentLine'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:indentLine_char = '¦'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'synmark.vim'
Plugin 'Auto-Pairs'
"Plugin 'python-imports.vim'
call vundle#end()
filetype on
filetype plugin on
filetype indent on

""""""
"Highligh redundant spaces
""""""
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

""""""
" Highlight 80 characters per line
""""""
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=80

""""""
"from libvirt HACKING
""""""
set cinoptions=(0,:0,l1,t0,L3
au FileType make setlocal noexpandtab
au BufRead,BufNewFile *.am setlocal noexpandtab

""""""
" File type
""""""
"au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
"au BufRead,BufNewFile *.{go}   set filetype=go
"au BufRead,BufNewFile *.{js}   set filetype=javascript

"au FileType c setlocal dict+=~/.vim/dict/c.dict
"au FileType css setlocal dict+=~/.vim/dict/css.dict
"au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
"au FileType html setlocal dict+=~/.vim/dict/javascript.dict
"au FileType html setlocal dict+=~/.vim/dict/css.dict

""""""
" Keyboard mapping
""""""
" Tab Navigation
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
" Remove blank line
"nnoremap <F8> :g/^\s*$/d<CR>
:noremap <F7> :buffers<CR>:buffer<Space>

""""""
"tagbar
""""""
nmap <leader>tb :TagbarToggle<CR>
nmap <F2> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_ctags_bin = '/usr/bin/ctags'

""""""
" NERDTree
""""""
let NERDTreeIgnore=['\.pyc']
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>

""""""
"airline statusline
""""""
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = '|'
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'

""""""
" Show Markdown
""""""
"nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
"nmap <F9>  :!chromium --incognito %.html & <CR><CR>
"nmap \ \cc
"vmap \ \cc

""""""
" Replace tab by spaces
""""""
"nmap tt :%s/\t/    /g<CR>

""""""
"ctrlp
""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']

""""""
"YouCompleteMe
""""""
let g:ycm_python_binary_path = '/usr/bin/python2'
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"youcompleteme 默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"force recomile with syntastic
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR> "
nmap <F4> :YcmDiags<CR>

""""""
"ultisnipsu
""""""
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsSnippetDirectories=["snippets", "bundle/ultisnips/UltiSnips"]

""""""
"syntastic
""""""
execute pathogen#infect()
let g:syntastic_error_symbol = '✗'   "set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
""highlight SyntasticErrorSign guifg=white guibg=black
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1 "whether to show balloons
