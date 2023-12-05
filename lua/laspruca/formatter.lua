local prettier = require("formatter.filetypes.javascript").prettier

require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		javascript = { prettier },
		javascriptreact = { prettier },
		typescript = { prettier },
		typescriptreacct = { prettier },
		svelte = { prettier },
	},
})

-- Format on save
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
