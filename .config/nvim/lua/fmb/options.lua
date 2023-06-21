-- See `:help vim.o`
-- Enable mouse mode
vim.o.mouse = 'a'

-- Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.smartcase = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.wrap = false
vim.o.showmatch = true
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Better scroll and splits
vim.o.scrolloff = 8
vim.o.splitbelow = true
vim.o.splitright = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.o.backspace = 'indent,eol,start'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.o.cursorline = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"
