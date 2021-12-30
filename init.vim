" Specify a directory for plugins:
" - For Neovim: stdpath('data') . '/plugged'
"   plugge
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'tomlion/vim-solidity'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'folke/lsp-colors.nvim'
Plug 'neovimhaskell/haskell-vim'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'cespare/vim-toml'
"Plug 'dense-analysis/ale'
Plug 'szw/vim-tags'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"plugins here, coc for example
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'bfrg/vim-cpp-modern'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'terryma/vim-multiple-cursors'
" Initialize plugin system
call plug#end()

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

let g:lsp_cxx_hl_use_text_props = 1

highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <C-space> coc#refresh()

"GoTo code navigation
nmap <leader>g <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

"show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr> 
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

filetype on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

"let g:ycm_semantic_triggers = {'haskell' : ['.']}
" Start autocompletion after 4 chars
"let g:ycm_min_num_of_chars_for_completion = 4
"let g:ycm_min_num_identifier_candidate_chars = 4
"let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
"let g:ycm_add_preview_to_completeopt = 0

" Source a global configuration file if available
set hidden
set number
set omnifunc=glsl#CompleteFunc

let g:clang_format#auto_format = 1

let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
let g:rustfmt_command = "rustup run nightly rustfmt"

autocmd FileType c,cpp ClangFormatAutoEnable

let g:go_auto_sameids = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fmt_experimental = 1
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['golint', 'govet']
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:cpp_named_requirements_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

nmap <F8> :TagbarToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree
set exrc
set secure
set autochdir 
set tags+=./tags;

noremap <C-[> :tabprevious<CR>
noremap <C-]> :tabnext<CR>
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_right_alt_sep = '|'
let g:airline_right_sep = ' '

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='supernova'
" highlight clear SignColumn

let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

colorscheme onehalfdark
set tabstop=3 
