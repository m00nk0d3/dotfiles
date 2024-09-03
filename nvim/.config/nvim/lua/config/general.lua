local opt = vim.opt

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.breakindent = true
opt.linebreak = true
opt.showbreak = string.rep(" ", 3) .. "↳ "

-- line numbers
opt.relativenumber = true
opt.number = true
