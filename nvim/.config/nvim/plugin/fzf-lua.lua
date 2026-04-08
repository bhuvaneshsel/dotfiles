vim.pack.add({
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/ibhagwan/fzf-lua",
})

require("mini.icons").setup()
require("fzf-lua").setup()
require("fzf-lua").register_ui_select()

vim.keymap.set("n", "<leader>ff", function()
	require("fzf-lua").files()
end, { desc = "[F]ind [F]iles in Current Working Directory" })

vim.keymap.set("n", "<leader>fg", function()
	require("fzf-lua").live_grep()
end, { desc = "[F]ind by [G]repping in Current Working Directory" })

vim.keymap.set("n", "<leader>fn", function()
	require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[F]ind in [N]eovim Configuration" })

vim.keymap.set("n", "<leader>fb", function()
	require("fzf-lua").lgrep_curbuf()
end, { desc = "[F]ind in Current [B]uffer" })

vim.keymap.set("n", "<leader>fw", function()
	require("fzf-lua").grep_cword()
end, { desc = "[F]ind [W]ord in Current Working Directory" })

vim.keymap.set("n", "<leader>fW", function()
	require("fzf-lua").grep_cWORD()
end, { desc = "[F]ind [W]ORD in Current Working Directory" })

vim.keymap.set("n", "<leader><leader>", function()
	require("fzf-lua").buffers()
end, { desc = "[ ] Search Open Buffers" })

vim.keymap.set("n", "<leader>fz", function()
	require("fzf-lua").zoxide()
end, { desc = "[F]ind Directories From [Z]oxide" })

vim.keymap.set("n", "<leader>fm", function()
	require("fzf-lua").builtin()
end, { desc = "[F]ind in Builtin ([M]isc)" })

vim.keymap.set("n", "<leader>gd", function()
	require("fzf-lua").lsp_definitions({})
end, { desc = "[G]oto [D]efinition" })

vim.keymap.set("n", "<leader>gD", function()
	require("fzf-lua").lsp_declarations()
end, { desc = "[G]oto [D]eclaration" })

vim.keymap.set("n", "<leader>gr", function()
	require("fzf-lua").lsp_references()
end, { desc = "[G]oto [R]eferences" })

vim.keymap.set("n", "<leader>gi", function()
	require("fzf-lua").lsp_implementations()
end, { desc = "[G]oto [I]mplementation" })

vim.keymap.set("n", "<leader>gt", function()
	require("fzf-lua").lsp_typedefs()
end, { desc = "[G]oto [T]ype Definitions" })

vim.keymap.set("n", "<leader>rn", function()
	vim.lsp.buf.rename()
end, { desc = "[R]e[N]ame" })

vim.keymap.set("n", "<leader>ca", function()
	require("fzf-lua").lsp_code_actions()
end, { desc = "Open [C]ode [A]ctions" })

vim.keymap.set("n", "<leader>fd", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "[F]ind in Document [D]iagnostics" })

vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float()
end, { desc = "[E] Show Diagnostics" })
