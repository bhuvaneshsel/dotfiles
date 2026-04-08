vim.pack.add({
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/stevearc/oil.nvim",
})

require("mini.icons").setup()

require("oil").setup({
	float = {
		border = "rounded",
	},
	view_options = {
		show_hidden = true,
	},
})

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
