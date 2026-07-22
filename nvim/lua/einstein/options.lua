vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.winborder = "rounded"
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.clipboard = "unnamedplus"
vim.o.laststatus = 3
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.cursorcolumn = false
vim.o.ignorecase = true
vim.o.conceallevel = 2
vim.o.guicursor = "n-v-c:block,i-ci-ve:block,r-cr-o:block"
vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
})

require('vim._core.ui2').enable()
