" Install vim-plug
if empty(glob($NVIM_CONFIG_DIR . '/autoload/plug.vim'))
    silent !curl -fLo $NVIM_CONFIG_DIR/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    source $NVIM_CONFIG_DIR/autoload/plug.vim
endif

" Install missing plugins and reload config
augroup InstallPlugins
    autocmd!
    autocmd VimEnter *
        \  let s:missing_plugins = filter(values(g:plugs), '!isdirectory(v:val.dir)')
        \| if len(s:missing_plugins) > 0
        \|   PlugInstall --sync | q | source $MYVIMRC
        \| endif
augroup end

call plug#begin()

" UI
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'gcmt/taboo.vim'

" Tools
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/committia.vim'
Plug 'chaoren/vim-wordmotion'

" Autocomplete
Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() } }

" Languages
Plug 'leafgarland/typescript-vim',    { 'for': 'typescript' }
Plug 'joukevandermaas/vim-ember-hbs', { 'for': 'html.handlebars' }
Plug 'Freedzone/kerbovim',            { 'for': 'kerboscript', 'do': 'dos2unix */*.vim' }

call plug#end()
