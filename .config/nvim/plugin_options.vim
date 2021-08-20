let g:airline_powerline_fonts = 1

" Tabline
let g:taboo_tab_format = '%N: %S'
let g:airline#extensions#taboo#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_splits = 0

" Bufexplorer
let g:bufExplorerShowRelativePath = 1

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Auto close NERDTree if it is the last open window
augroup CloseNERDTree
    autocmd!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup end

" Enable completion plugin
autocmd BufEnter * lua require'completion'.on_attach()

" Configure LSP
lua <<EOF
local nvim_lsp = require'lspconfig'

local on_lsp_attach = function(client)
    require'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({ on_attach=on_lsp_attach })

EOF
