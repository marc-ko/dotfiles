local opt = vim.opt

-- line number --
opt.relativenumber = true
opt.number = true

-- indentation --
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true


-- cursor line --
opt.cursorline = true

-- split window --
opt.splitright = true
opt.splitbelow = true

-- searching --
opt.ignorecase = true
opt.smartcase = true

-- appearance --
opt.termguicolors = true
opt.signcolumn = "yes"
vim.cmd[[colorscheme tokyonight-moon]]
