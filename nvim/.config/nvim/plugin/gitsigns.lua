vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
require("gitsigns").setup({
	signs = {
		delete = { text = "┃" },
	},
	signs_staged = {
		delete = { text = "┃" },
	},
	current_line_blame_opts = {
		delay = 0,
	},
	preview_config = {
		border = "rounded",
	},
})

vim.keymap.set("n", "<leader>gb", function()
	require("gitsigns").blame_line({ full = true })
end)

vim.keymap.set("n", "<leader>tb", require("gitsigns").toggle_current_line_blame)

vim.keymap.set("n", "<leader>sh", require("gitsigns").stage_hunk)
vim.keymap.set("n", "<leader>rh", require("gitsigns").reset_hunk)

vim.keymap.set("v", "<leader>sh", function()
	require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
vim.keymap.set("v", "<leader>rh", function()
	require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)

vim.keymap.set("n", "<leader>ph", require("gitsigns").preview_hunk)
vim.keymap.set("n", "<leader>dt", require("gitsigns").diffthis)

vim.keymap.set("n", "]h", function()
	require("gitsigns").nav_hunk("next")
end)
vim.keymap.set("n", "[h", function()
	require("gitsigns").nav_hunk("prev")
end)
