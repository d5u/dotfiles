" nvimrc file
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vim/vimrc
"
"
" set nocompatible  " This is set by default in neovim
"
" mapleader config
map <Space> <Nop>
" map <Space> <Leader>
let mapleader = ","

" Init minpac
packadd minpac
call minpac#init()

" To install or update plugins:
" call minpac#update()

" To uninstall unused plugins:
" call minpac#clean()

" To see plugins status:
" call minpac#status()

" have minpac manage minpac
" use opt so that we can load the plugin via packadd before
" any other plugin
call minpac#add('k-takata/minpac', {'type': 'opt'})


"" minpac plugins
call minpac#add('metakirby5/codi.vim')
call minpac#add('ruanyl/vim-fixmyjs')

"" Colorschemes and aesthetics
call minpac#add('arcticicestudio/nord-vim')
call minpac#add('ryanoasis/vim-devicons')

"" Terminal
call minpac#add('kassio/neoterm')

"" Editing
call minpac#add('tpope/vim-repeat')       " Enable repeating supported plugin maps with .
call minpac#add('tpope/vim-unimpaired')   " pairs of handy bracket mappings
call minpac#add('tpope/vim-surround')     " Quoting parenthesing made simple
call minpac#add('scrooloose/nerdcommenter') " Comments
" call minpac#add('scrooloose/syntastic')   "syntax checking 

"" Autocompletion
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})

"" Typescript support
call minpac#add('mhartington/nvim-typescript', {'do': './install.sh'})


"" Like using LSP - Language Server Protocol
" call minpac#add('autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ })

"" Displays function signatures from completions in the command line
call minpac#add('Shougo/echodoc.vim')


"" Customize UI
call minpac#add('itchyny/lightline.vim')  " Custom Status line

"" File system
call minpac#add('junegunn/fzf')            " fuzzy file search
call minpac#add('junegunn/fzf.vim')        " fuzzy file search
call minpac#add('scrooloose/nerdtree')     " File tree explorer
call minpac#add('tpope/vim-projectionist') " Semantic based navigation configurable per project
call minpac#add('mhinz/vim-grepper')       " Search files

" Support for other tools
call minpac#add('tpope/vim-fugitive')     " git wrapper
call minpac#add('tpope/vim-dispatch')     " dispatch other tools such as compilers, linters, etc
call minpac#add('radenling/vim-dispatch-neovim') 
call minpac#add('w0rp/ale')               " linting, code completion, go to definition
call minpac#add('janko-m/vim-test')       " testing helpers

" Support for languages
call minpac#add('tpope/vim-ragtag')       " XML/HTML mappings
call minpac#add('godlygeek/tabular')       " required by vim-markdown
call minpac#add('plasticboy/vim-markdown') " markdown support
call minpac#add('mattn/emmet-vim') " emmet
call minpac#add('cakebaker/scss-syntax.vim') " SASS

"" JavaScript
call minpac#add('pangloss/vim-javascript') " JavaScript
call minpac#add('mxw/vim-jsx')             " JSX

"" TypeScript
" call minpac#add('leafgarland/typescript-vim') " TypeScript
" call minpac#add('HerringtonDarkholme/yats.vim') " TypeScript
" call minpac#add('Shougo/vimproc.vim', {'do': 'make'}) " needed for tsuquyomi
" call minpac#add('Quramy/tsuquyomi')          " TypeScript language services and such
" This doesn't seem to work very well with neovim. I need to investigate further

"" Elm
" call minpac#add('ElmCast/elm-vim')   " Elm  support

" Autoclose tags and quotes
 call minpac#add('Townk/vim-autoclose')    " autoclose parens and stuff
 call minpac#add('alvan/vim-closetag')     " autoclose html tags


" Distraction free modes
call minpac#add('junegunn/goyo.vim')      " distraction free mode
call minpac#add('junegunn/limelight.vim') " focus on what you're writing now

" Sessions and integration with other tools
call minpac#add('tpope/vim-obsession') " easy save sessions
call minpac#add('christoomey/vim-tmux-navigator') " Better navigation integration with tmux
call minpac#add('vim-ctrlspace/vim-ctrlspace')
" Tmux navigator
" <ctrl-h> => Left
" <ctrl-j> => Down
" <ctrl-k> => Up
" <ctrl-l> => Right
" <ctrl-\> => Previous split
call minpac#add('matze/vim-move')


"" Plugins config
"""" Markdown
" esLint/Fixmyjs
" au BufWritePre *.js :Fixmyjs
" au BufWritePre *.jsx :Fixmyjs
" noremap <Leader>f :Fixmyjs<CR>
" let g:syntastic_javascript_checkers = ['eslint']
" Highlight YAML front matter
let g:vim_markdown_frontmatter = 1
"""" FZF - bind file fuzzy search to C-p
nnoremap <C-p> :<C-u>FZF<CR> 
"""" minpac - simpler commands
command! PackUpdate source $MYVIMRC | call minpac#update()
command! PackClean source $MYVIMRC | call minpac#clean()
command! PackStatus source $MYVIMRC | call minpac#status()
"" Ale
let g:ale_linters = {
\'javascript': ['eslint'],
\'typescript': ['tsserver'],
\}
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_first)
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

" Set this variable to 1 to fix files when you save them.
nmap <F8> <Plug>(ale_fix)
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['prettier'],
\   'javascript': ['eslint'],
\}


" review these
"nnoremap <Leader>c :call LanguageClient_contextMenu()<CR>
"nnoremap <silent> <Leader>K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <Leader>r :call LanguageClient#textDocument_rename()<CR>

"" tsuquyomi
let g:tsuquyomi_completion_detail = 1
"""" grepper
let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']
" Search for current word
nnoremap <Leader>* :GrepperRg -cword -noprompt<CR> " Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
" Open grepper prompt for different tools
nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>
"""" closetags
" filenames like *.xml, *.html, *.xhtml, ...
" let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"
"""" limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Load the plugins right now. (optional)
"packloadall

" Color scheme
"" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Set colorscheme
colorscheme nord

"" lightline color scheme
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"" Basic vim setup
inoremap jk <Esc>
inoremap {<CR> {<CR>}<C-o>O
inoremap (<CR> (<CR>)<C-o>O
"remap Esc to jk quick succession
:set mouse=a "mouse support
" Filetypes
" This enables file type detection (like filetype on)
" and also loading plugins and indentation per filetype
filetype plugin indent on
syntax enable    " enable syntax highlighting

"" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


set autoindent   " Copy indent from current line when starting a new line

set clipboard+=unnamed " use system clipboard
set showcmd      " display incomplete commands
set noshowmode     " display the mode you're in
set backspace=indent,eol,start "intuitive backspacing"
set hidden       " Handle multiple buffers better
set wildmenu     " enhanced command line completion
set wildmode=list:longest " complete files like a shell
set listchars=""
set nolist

""" Search
set ignorecase   " case-insensitive search
set smartcase    " but case-sensitive if expression contains a capital letter
set number	 " show line number
" set relativenumber "show relative line number
set ruler        " show cursor position
set incsearch    " highlight matches as you type
set hlsearch     " highlight matches
nnoremap <leader><space> :noh<CR>  " clear highlights


""" Regex
set gdefault     " use global option in regex by default

set wrap         " turn on line wrapping
set scrolloff=3  " show 3 lines of context around cursor
set display+=lastline "Display as much as possible of a window's last line
set list         " show invisible characters
set title        " show terminal title
set visualbell   " no beeping

"" Global tabs/spaces
set smarttab     " use spaces instead of tabs
set tabstop=2    " global tab width
set shiftwidth=2
set expandtab    " use spaces instead of tabs
set laststatus=2 " Always show a status line

set nobackup " no backups
set nowritebackup " no backups
set noswapfile " no swap files
set autoread " automatically re-read files changed outside of vim
set nofoldenable " disable folding

" Navigation: cCustom Motions/Movements
"source $VIMCONFIG/navigation-mappings.vim
" Custom Text editing
"source $VIMCONFIG/editing-mappings.vim
" Gatsby blogging
"source $VIMCONFIG/gatsby-blogging.vim
"

map <C-o> :NERDTreeToggle<CR>
map gb :tabp<CR>

"" Move line binds
let g:move_key_modifier = 'C'
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==
"inoremap <C-j> <Esc>:m .+1<CR>==gi
"inoremap <C-k> <Esc>:m .-2<CR>==gi
"vnoremap <C-j> :m '>+1<CR>gv=gv
"vnoremap <C-k> :m '<-2<CR>gv=gv

"Terminal keybinds
"nnoremap <F3> :Ttoggle<cr><C-w><C-w>A
"inoremap <F3> <esc>:Ttoggle<cr><C-w><C-w>A
"tnoremap <F3> <C-\><C-n>:Ttoggle<cr>
"tnoremap <esc> <C-\><C-n>
"tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>

" Workspace Setup

"function! DefaultWorkspace()
"    " Rough num columns to decide between laptop and big monitor screens
"    let numcol = 2
"    if winwidth(0) >= 220
"        let numcol = 3
"    endif
"
"    if numcol == 3
"        e term://zsh
"        file Shell\ Two
"        vnew
"    endif
"
"    vsp term://~/Programs/golang/context
"    file Context
"    sp term://zsh
"    file Shell\ One
"    wincmd k
"    resize 4
"    wincmd h
"endfunction
"command! -register DefaultWorkspace call DefaultWorkspace()
