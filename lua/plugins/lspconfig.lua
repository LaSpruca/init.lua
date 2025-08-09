return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	version = "^2.0.0",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "mason-org/mason-lspconfig.nvim", version = "^2.0.0" },
	},
	config = function()
		-- in init.lua or a module
		vim.lsp.config("*", {
			on_attach = function(client, bufnr)
				-- Keymaps
				local buf = bufnr
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf })
				vim.keymap.set("n", "g.", vim.lsp.buf.code_action, { buffer = buf })
				-- Add more keymaps as needed...

				-- Optional: enable virtual text for diagnostics
				vim.diagnostic.config({
					virtual_text = true,
					signs = true,
					underline = true,
				})
			end,
		})

		require("mason-lspconfig").setup({
			ensure_installed = {},
			handlers = {
				-- this first function is the "default handler"
				-- it applies to every language server without a "custom handler"
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				-- this is the "custom handler" for `lua_ls`
				lua_ls = function()
					-- (Optional) Configure lua language server for neovim
					local lua_opts = lsp_zero.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
			},
		})
	end,
}
