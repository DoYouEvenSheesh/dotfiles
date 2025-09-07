vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])
vim.opt.winborder = "rounded"
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.textwidth = 80
local map = vim.keymap.set
vim.g.mapleader = " "
map('n', '<leader>so', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>v', ':e $MYVIMRC<CR>')
map({ 'n', 'v' }, '<leader>y', '"+y')
map({ 'n', 'v' }, '<leader>d', '"+d')
map({ 'n', 'v' }, '<leader>c', '1z=')

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp", version = "1.6.0" },
})

require "mason".setup()
require "mini.pick".setup()
require "oil".setup()
require "blink.cmp".setup()

map('n', '<leader>f', ":Pick files<CR>")
map('n', '<leader>h', ":Pick help<CR>")
map('n', '<leader>e', ":Oil<CR>")
map('n', '<leader>lf', vim.lsp.buf.format)

vim.lsp.config['vala'] = {
  cmd = {'vala-language-server'},
  filetypes = {'vala', 'genie'},  -- Add any other relevant filetypes if needed
  root_markers = {'.git', 'meson.build', 'CMakeLists.txt'},
  settings = {},
}

vim.lsp.enable(
	{
		"lua_ls", "svelte", "tinymist", "emmetls", "rust_analyzer", "slint-lsp", "clangd", "gopls", "vala"
	}
)

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})

require "nvim-treesitter".setup({
	sync_install = false,
	auto_install = true,
	indent = { enable = true },
	highlight = {
		enabled = true,

		disable = function(lang, buf)
			local max_filesize = 100 * 1024
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

	},

})

vim.cmd.colorscheme "catppuccin-mocha"
vim.cmd(":hi statusline guibg=NONE guifg=NONE")
