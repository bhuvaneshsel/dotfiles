vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

-- Update Treesitter parsers when there is a plugin update
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

local function treesitter_try_attach(buffer, language)
	if not vim.treesitter.language.add(language) then
		return
	end

	-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
	-- vim.wo.foldmethod = 'expr'

	vim.treesitter.start(buffer, language)

	vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

-- Autoinstall and load parsers
local available_parsers = require("nvim-treesitter").get_available()
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local buffer, filetype = args.buf, args.match
		local language = vim.treesitter.language.get_lang(filetype)
		if not language then
			return
		end

		local installed_parsers = require("nvim-treesitter").get_installed("parsers")

		if vim.tbl_contains(installed_parsers, language) then
			treesitter_try_attach(buffer, language)
		elseif vim.tbl_contains(available_parsers, language) then
			require("nvim-treesitter").install(language):await(function()
				treesitter_try_attach(buffer, language)
			end)
		else
			treesitter_try_attach(buffer, language)
		end
	end,
})
