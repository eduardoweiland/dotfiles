local set = vim.opt

-- General options
set.guifont      = 'Hack Nerd Font Mono 9'
set.fileencoding = 'utf-8'        -- Default file encoding
set.mouse        = 'a'            -- Enable mouse in all modes
set.number       = true           -- Show line numbers
set.signcolumn   = 'yes'          -- Always show diagnostics column
set.cursorline   = true           -- Highlight current line
set.hidden       = true           -- Allow to hide a modified buffer
set.scrolloff    = 5              -- Keep 5 lines between cursor and screen border
set.shortmess    = 'aoOstTcF'     -- Avoid showing extra messages
set.inccommand   = 'split'        -- Preview substitute results in split panel
set.clipboard    = 'unnamedplus'  -- Enable integration with system clipboard

-- Completion options
set.pumheight   = 10         -- Maximum number of suggestions shown
set.completeopt = { 'menuone', 'noinsert', 'noselect' }

-- Command line options
set.showmode    = false
set.wildmenu    = true
set.wildmode    = { 'longest', 'list', 'full' }

-- New splits location
set.splitbelow  = true
set.splitright  = true

-- Default formatting options
set.tabstop     = 4
set.shiftwidth  = 4
set.expandtab   = true
set.shiftround  = true
set.autoindent  = true
set.smartindent = true
set.colorcolumn = '120'
