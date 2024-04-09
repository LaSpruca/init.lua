local lsp_zero = require("lsp-zero")
-- local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua-language-server",
		"vim-language-server",
		"stylua",
		"shellcheck",
		"editorconfig-checker",
		"misspell",
		"shellcheck",
		"shfmt",
		"rust-analyzer",
		"typescript-language-server",
		"prettier",
		"eslint",
		"svelte-language-server",
		"clangd",
		"clang-format",
		"java-language-server",
	},
})

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
	-- Add diagnostics keybind
	vim.keymap.set("n", "g.", vim.lsp.buf.code_action, { buffer = bufnr })
end)

require("mason-lspconfig").setup({
	handlers = {
		lsp_zero.default_setup,
	},
})

-- Lint on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
