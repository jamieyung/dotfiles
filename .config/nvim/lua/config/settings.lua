-- Disable providers we don't care about
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_perl_provider    = 0
vim.g.loaded_python_provider  = 0

-- Disable some in built plugins completely
vim.g.loaded_netrw            = 1
vim.g.loaded_netrwPlugin      = 1
vim.g.loaded_matchparen       = 1
vim.g.loaded_matchit          = 1
vim.g.loaded_2html_plugin     = 1
vim.g.loaded_getscriptPlugin  = 1
vim.g.loaded_gzip             = 1
vim.g.loaded_logipat          = 1
vim.g.loaded_rrhelper         = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin        = 1
vim.g.loaded_vimballPlugin    = 1
vim.g.loaded_zipPlugin        = 1

vim.g.mapleader=' '
vim.opt.foldmethod='indent'
vim.opt.foldlevelstart=9 -- Unfold all by default
vim.opt.fml=0 -- Allow single lines to be folded (default is two or more)
vim.opt.inccommand='split' -- live preview of substitute
vim.opt.clipboard='unnamedplus' -- use system clipboard for copy paste
vim.opt.hidden=true
vim.cmd('au VimLeave * set guicursor=a:block-blinkon0')
vim.opt.bg='dark'
pcall(vim.cmd, 'colorscheme catppuccin-frappe') -- everforest, catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.opt.updatetime=100 -- set updatetime to 100ms to make gitsigns more responsive
vim.opt.timeoutlen=200
-- vim.opt.colorcolumn='80'
vim.opt.signcolumn='yes:1'
vim.opt.number=true -- show line numbers
vim.opt.mouse='a' -- enable mouse
vim.opt.encoding='utf-8' -- set encoding to UTF-8
vim.opt.wildmenu=true -- visual autocomplete for command menu
vim.opt.lazyredraw=true -- redraw screen only when need to
vim.opt.showmatch=true -- highlight matching parens/brackets [()}]
vim.opt.laststatus=2 -- always show statusline (even with only a single window)
vim.opt.ruler=true -- show line and column number of the cursor on right side of statusline
vim.opt.visualbell=true -- blink cursor on error instead of beeping
vim.opt.confirm=true -- instead of failing a command because of unsaved changes, raise a dialog asking if you wish to save changed files.
vim.opt.undofile=true -- maintain undo history between sessions
vim.opt.undodir='/Users/jamie/.config/nvim/undodir/' -- store undofiles in single directory
vim.opt.swapfile=false -- disable swapfiles
vim.opt.showcmd=true -- show command in bottom bar
vim.opt.incsearch=true -- search as characters are entered
vim.opt.hlsearch=true -- highlight matches
vim.opt.tw=0 -- prevent auto-indent by disabling textwidth
vim.opt.autoindent=true -- copy indent from current line when starting a new line

-- Use case insensitive search, except when using capital letters
vim.opt.ignorecase=true
vim.opt.smartcase=true

-- indentation settings for using 4 spaces instead of tabs.
-- do not change 'tabstop' from its default value of 8 with this setup.
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.expandtab=true

-- show whitespace
vim.opt.list=true
vim.opt.listchars='tab:>-,trail:~,extends:>,precedes:<'

-- use filetype-based syntax highlighting, ftplugins, and indentation
vim.cmd([[
syntax enable
filetype plugin indent on
]])
