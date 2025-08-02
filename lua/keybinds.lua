vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")

vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")

vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
vim.keymap.set("n", "<leader>h", ":split<CR>")

vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")

vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>g", ":Pick grep_live<CR>")

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
