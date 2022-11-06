call plug#begin('~/.vim/plugged')

Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline' " statusbar/tabline
Plug 'vim-airline/vim-airline-themes'
Plug 'hashivim/vim-terraform'
Plug 'SirVer/ultisnips' " Ultimate snippets
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'navarasu/onedark.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'neovim/nvim-lspconfig'

" -- autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
"" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
"Plug 'golang/vscode-go'
" "" luasnip
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'sebdah/vim-delve'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'f-person/auto-dark-mode.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'


call plug#end()


filetype on "detect files based on type
filetype plugin on "load plugin file
filetype indent on "maintain indentation
set nu "enable numbers
set mouse=a " Mouse scrolling
set tabstop=2 " Indentation
set shiftwidth=2
set smarttab
set smartindent
set expandtab
set noswapfile " No .swap files
set cursorline

" Leader
let mapleader = ','
let g:mapleader = ','

" LSP
lua require("lsp_config")
lua require("lsp_cmp_config")
lua require("lsp_ts")
lua require("trouble")
lua require('luasnip.loaders.from_vscode').lazy_load()

autocmd BufWritePre *.go lua OrgImports(1000)
autocmd BufWritePre *.go lua vim.lsp.buf.format { async = true }

" Auto dark mode
lua require("auto_dark_mod")

" Vim Go
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_doc_keywordprg_enabled = 0
let g:go_code_completion_enabled = 0

let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
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
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1

" CtrlP
let g:ctrlp_map = '<c-p>'

" Ultisnip
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Terraform
let g:terraform_fmt_on_save = 1
let g:terraform_align=1
autocmd BufNewFile,BufRead *.policy setl ft=terraform

"" Re-mappings

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" vv to generate new vertical split
nnoremap <silent> vv <C-w>v
nnoremap <silent> qq :q<CR>
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" Play with buffers
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>q :bw<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>ww :wq<CR>
nnoremap <Leader>zz :q<CR>
" Cursors
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <leader>s :lclose<CR>
" vv to generate new vertical split
nnoremap <silent> vv <C-w>v
" disable highlight
map <silent> <leader><cr> :noh<cr>
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Delete current word
inoremap <C-BS> <C-O>b<C-O>dw
noremap <C-BS> bdw

colorscheme onedark
let g:onedark_style = 'cool'
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:netrw_preview = 1

" Telescope
" https://github.com/nvim-telescope/telescope.nvim#default-mappings
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
