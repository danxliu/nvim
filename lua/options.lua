-- General Options
vim.o.mouse = 'a'
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.swapfile = false
vim.o.termguicolors = true

-- Visual Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.showmode = false

-- Search Options
vim.o.ignorecase = true
vim.o.smartcase = true

-- Indentation Options
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

vim.g.mapleader = " "

-- Status Line
function _G._status_diag()
  local levels = vim.diagnostic.severity
  local errors = #vim.diagnostic.get(0, {severity = levels.ERROR})
  local warnings = #vim.diagnostic.get(0, {severity = levels.WARN})
  if errors > 0 or warnings > 0 then
    return ' '..tostring(errors)..'󰅙 '..tostring(warnings)..' '
  end
  return ' 󰗠'
end
vim.o.statusline = "%{mode()} %f %{v:lua._status_diag()} %r%m%=%{&filetype} %3l:%-2c"
