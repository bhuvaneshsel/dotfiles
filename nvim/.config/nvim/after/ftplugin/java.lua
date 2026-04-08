local root_file = vim.fn.expand("%:p")
local root_class = vim.fn.expand("%:t:r")

local externals = {
	mysql_connector = "/Users/bhuvaneshselvaraj/Downloads/mysql-connector-j-9.5.0/mysql-connector-j-9.5.0.jar",
}

local function build_classpath(externals)
	local parts = { "." }
	for _, path in pairs(externals) do
		table.insert(parts, path)
	end
	return table.concat(parts, ":")
end

local classpath = build_classpath(externals)

local cmd = string.format("javac -cp %s %s && java -cp %s %s", classpath, root_file, classpath, root_class)

local Terminal = require("toggleterm.terminal").Terminal
local java = Terminal:new({
	cmd = cmd,
	hidden = true,
	close_on_exit = false,
})

function _java_toggle()
	java:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua _java_toggle()<CR>", { noremap = true, silent = true })
vim.opt_local.makeprg = string.format("sh -c 'javac -cp %s %% && java -cp %s %%:t:r'", classpath, classpath)
