vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

--Run lua code
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

--Remap capslock
vim.api.nvim_set_keymap('n', '<CapsLock>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<CapsLock>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', '<CapsLock>', '<Esc>', { noremap = true, silent = true })

vim.wo.relativenumber = true

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
