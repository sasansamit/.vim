" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" on demand loading of plugins
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Linters
Plug 'https://github.com/moll/vim-node.git'
Plug 'https://github.com/godlygeek/tabular.git'
Plug 'https://github.com/hallettj/jslint.vim.git'
Plug 'https://github.com/walm/jshint.vim.git'

" Syntax 
Plug 'https://github.com/jelera/vim-javascript-syntax.git'
Plug 'https://github.com/kchmck/vim-coffee-script.git'
Plug 'https://github.com/digitaltoad/vim-pug.git'
Plug 'https://github.com/wavded/vim-stylus.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'https://github.com/juvenn/mustache.vim.git'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'https://github.com/ekalinin/Dockerfile.vim.git'
Plug 'https://github.com/martinda/Jenkinsfile-vim-syntax.git'

" Editing
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'

" Snippets
Plug 'https://github.com/SirVer/ultisnips.git'
"Plug 'https://github.com/garbas/vim-snipmate.git'
"Plug 'https://github.com/tomtom/tlib_vim.git'
"Plug 'https://github.com/MarcWeber/vim-addon-mw-utils.git' " snipmate dependency
Plug 'https://github.com/honza/vim-snippets.git' " community owned  snippets files for various programming languages
"Plug 'https://github.com/jamescarr/snipmate-nodejs.git'

" Completions
Plug 'https://github.com/guileen/vim-node-dict.git'
Plug 'https://github.com/myhere/vim-nodejs-complete.git'
Plug 'https://github.com/ahayman/vim-nodejs-complete.git'
Plug 'https://github.com/ternjs/tern_for_vim.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git'

" Browsing
Plug 'https://github.com/wincent/command-t.git', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'https://github.com/mileszs/ack.vim.git'


" Colorschemes
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/marcus/vim-mustang.git'


" Node debug
Plug 'https://github.com/sidorares/node-vim-debugger.git'

" SCM plugins
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'

" status bar plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Initialize plugin system
call plug#end()

filetype plugin indent on


" Setup the color scheme
set background=dark
color xoria256


" formatting defaults, for details - http://tedlogan.com/techblog3.html
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set nowrap


set number                     " turn on line numbers
set title
syntax on
set nobackup
set noswapfile                 " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler                      " show the cursor position all the time
set incsearch                  " do incremental searching
set wrapscan                   " Searches wrap around end of the file.
set ignorecase
set smartcase
set autowrite                  " Automatically :write before running commands
set cursorline                 " highlight the current line the cursor is on
set diffopt+=vertical          " start a diff in vertical split mode
set laststatus=2               " always have a status line
set showmatch                  " flashes matching brackets or parentheses
set scrolloff=5                " number of lines above and below the current line
set wildmenu                   " commandline auto completions come above the commandline
set splitbelow
set splitright                 " split new window on the right
set visualbell                 " No beeping
set hlsearch                   " Highlight search terms
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.

" setup airline
let g:airline_theme='kolor'
let g:airline#extensions#tabline#enabled = 1

" JS formatter using esformat
nnoremap <silent> <leader>e :call JSFormat()<cr>

function! JSFormat()
  " Preparation: save last search, and cursor position.
  let l:win_view = winsaveview()
  let l:last_search = getreg('/')
  let fileWorkingDirectory = expand('%:p:h')
  let currentWorkingDirectory = getcwd()
  execute ':lcd' . fileWorkingDirectory
  execute ':silent' . '%!esformatter'
  if v:shell_error
    undo
    "echo "esformatter error, using builtin vim formatter"
    " use internal formatting command
    execute ":silent normal! gg=G<cr>"
  endif
  " Clean up: restore previous search history, and cursor position
  execute ':lcd' . currentWorkingDirectory
  call winrestview(l:win_view)
  call setreg('/', l:last_search)
endfunction


" setup syntastic
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_classpath= '~/.vim/libs/checkstyle-8.0-all.jar'
let g:syntastic_java_checkstyle_conf_file = '~/.vim/libs/google_checks_with_suppressions.xml'

" Setup ultisnip
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-space>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


let g:syntastic_javascript_checkers = ['eslint']
