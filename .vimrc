"------------------------------------------------------------------
"   Global Stuff
"------------------------------------------------------------------

" Set the colorscheme - the one i really like
colorscheme github

" Turn syntax highlighting for files
syntax on

" Turn on ruler
set ruler

" Enable loading the plugin files for specific file types with
filetype plugin indent on

" Setthings for Pathogen plugin manager
call pathogen#runtime_append_all_bundles()
call pathogen#helptags() "call this when installing new plugins
execute pathogen#infect()

filetype plugin on
set number
set expandtab
set tabstop=4
set ai
set shiftwidth=4

nmap <F8> :TagbarToggle<CR>
map <F2> <C-W><C-]><C-W>L<CR>

" NERD Tree
let NERDTreeShowBookmarks = 1


" Auto commands section
au BufNewFile,BufRead *.app set filetype=xml
au BufNewFile,BufRead *.cmp set filetype=xml
" au BufNewFile,BufRead,BufEnter *.h,*.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" add a definition for Objective-C to tagbar
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }

" CLANG settings
let g:clang_use_library = 1
let g:clang_complete_copen = 1
let g:clang_hl_errors = 1
let g:clang_debug = 1
let g:clang_auto_select = 1

" nodejs completion
let g:nodejs_complete_config = {
\  'js_compl_fn': 'jscomplete#CompleteJS',
\  'max_node_compl_len': 15
\}
