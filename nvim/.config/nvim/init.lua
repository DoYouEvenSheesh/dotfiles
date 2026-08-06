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
map("n", "<leader>so", ":update<CR> :source<CR>")
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit<CR>")
map("n", "<leader>v", ":e $MYVIMRC<CR>")
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>d", '"+d')
map({ "n", "v" }, "<leader>c", "1z=")

vim.pack.add({
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

require("mason").setup()
require("mini.pick").setup()
require("oil").setup()
local cmp = require("blink.cmp")
cmp.build():wait(60000)
cmp.setup()

map("n", "<leader>f", ":Pick files<CR>")
map("n", "<leader>h", ":Pick help<CR>")
map("n", "<leader>e", ":Oil<CR>")
map("n", "<leader>lf", vim.lsp.buf.format)

vim.lsp.enable({
	"lua_ls",
	"svelte",
	"tinymist",
	"rust_analyzer",
	"clangd",
	"gopls",
	"lua-language-server",
	"pyright",
	"ocamllsp",
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		go = { "goimports", "gofumpt" },
		ocaml = { "ocamlformat" },
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"svelte",
		"markdown",
		"lua",
		"rust",
		"typst",
		"typescript",
		"javascript",
		"c",
		"cpp",
		"go",
		"zig",
		"python",
	},
	callback = function()
		vim.treesitter.start()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
})

vim.cmd.colorscheme("vague")
vim.cmd(":hi statusline guibg=NONE guifg=NONE")
