-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Appearance
vim.o.number = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes:2"
vim.o.cmdheight = 1
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.hlsearch = true
vim.o.cursorline = true
vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20-Cursor,o:hor50-Cursor"

-- Indentation
vim.o.wrap = false
-- vim.o.breakindent = true
-- vim.o.linebreak = true
vim.opt.display:append("lastline")
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.expandtab = false

-- Behavior
vim.o.hidden = true
vim.o.errorbells = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.o.undofile = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.opt.mouse:append("a")
vim.opt.iskeyword:remove("-")
vim.opt.iskeyword:remove("_")
-- vim.o.autocomplete = true
-- vim.opt.clipboard:append("unnamedplus")

-- Indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- QuickFix List
vim.keymap.set("n", "<C-n>", "<CMD>cn<CR>")
vim.keymap.set("n", "<C-p>", "<CMD>cp<CR>")

-- System Clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yy", '"+yy')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"_d"+p')
vim.keymap.set("v", "<leader>P", '"_d"+P')

--Undotree
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", function()
	require("undotree").open({
		command = math.floor(vim.api.nvim_win_get_width(0) / 3) .. "vnew",
	})
end, { desc = "[U]ndotree toggle" })

-- Highlight On Yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
