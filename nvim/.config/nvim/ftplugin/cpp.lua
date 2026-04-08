vim.opt_local.makeprg =
	"sh -c 'g++ -std=c++20 -Wall -Wextra -Wpedantic -Wconversion -Wsign-conversion -Werror -Wshadow -Wfloat-equal -Wdouble-promotion -Wnull-dereference % -o %< && ./%<'"

vim.keymap.set("n", "<leader>r", function()
	local file = vim.fn.expand("%")
	local exe = vim.fn.expand("%:r")

	local compile_cmd = "g++ -std=c++20 -Wall -Wextra -Wpedantic -Wconversion -Wsign-conversion "
		.. "-Wshadow -Wfloat-equal -Wdouble-promotion -Wnull-dereference "
		.. file
		.. " -o "
		.. exe

	local Terminal = require("toggleterm.terminal").Terminal

	local term = Terminal:new({
		cmd = compile_cmd .. " && ./" .. exe,
		direction = "float",
		close_on_exit = false,
	})

	term:toggle()
end, { desc = "Run C++ file", buffer = true })
