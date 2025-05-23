return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { 
	"lua", "c", "vim", 
	"vimdoc", "javascript", "html",
	"rust", "go", "markdown"
      },

      sync_installed = false,
      auto_install = true,
      indent = {enable = true},
      highlight = {
	enabled = true,

	disable = function(lang, bug)
	  local max_filesize = 100 * 1024
	  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	  if ok and stats and stats.size > max_filesize then
	    return true
	  end
	end,

      }

    })
  end
}
