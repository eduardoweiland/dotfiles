colorscheme codedark
syntax on

set guifont=DejaVuSansMono\ Nerd\ Font\ Mono\ 9

set mouse=a           " Enable mouse in all modes
set number            " Show line numbers
set noshowmode        " Don't show mode in command line
set cursorline        " Highlight current line
set inccommand=split  " Preview substitute results in split panel
set hidden            " Allow to hide a modified buffer
set scrolloff=5       " Keep 5 lines between cursor and screen border
set wildmenu          " Command completion mode
set wildmode=longest,list,full

" Default formatting options
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set autoindent
set smartindent
set colorcolumn=120

" Trim trailing whitespace on save
augroup TrimTrailing
    autocmd!
    autocmd BufWritePre *.* :%s/\s\+$//e
augroup end
