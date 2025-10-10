local opt = vim.opt -- for conciseness

-------------------- General Config -----------------------

-- Turn on true colors
opt.termguicolors = true

-- Disable the "~" character at blank lines
opt.fillchars = {
	fold = " ",
	vert = "│",
	eob = " ",
	msgsep = "‾",
}

-- Recommended settings from nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set clipboard to system clipboard
opt.clipboard = "unnamedplus"

------------- Indentation & Line Numbers -------------------
-- Line Wrapping
opt.wrap = false

-- Specify size of an indent when using >> and <<
opt.shiftwidth = 4

-- Number of spaces a tab counts for
opt.tabstop = 4

-- Convert tabs to spaces
opt.expandtab = true

-- Show relative line numbers
opt.relativenumber = true

-- Show absoulte line number on cursor line (when relative line number is on)
opt.number = true

------------- Search preferences -------------------

-- Ignores case when searching
-- e.g. -> print(Hello) will be found when searching \hello
opt.ignorecase = true

-- Case sensitive search when writing with mixed cases
-- e.g. -> print(LaTex) , \LATEX (will be false)
opt.smartcase = true

-------------- Folding ---------------
-- Allow function/class folding
opt.foldmethod = syntax
