return {
	"mhartington/formatter.nvim",
	config = function()
		local prettier = require("formatter.filetypes.javascript").prettier

		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},

				rust = {
					require("formatter.filetypes.rust").rustfmt,
				},
				cpp = { require("formatter.filetypes.cpp").clangformat },
				c = { require("formatter.filetypes.c").clangformat },
				java = { require("formatter.filetypes.java").clangformat },
				json = { prettier },
				javascript = { prettier },
				javascriptreact = { prettier },
				typescript = { prettier },
				typescriptreact = { prettier },
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
	end,
}
