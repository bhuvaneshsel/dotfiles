vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua", lsp_format = "fallback" },
		c = { "clang-format", lsp_format = "fallback" },
		cpp = { "clang-format", lsp_format = "fallback" },
	},
})

vim.keymap.set("n", "<Leader>cf", function()
	require("conform").format()
end, { desc = "[C]ode [F]ormat" })
