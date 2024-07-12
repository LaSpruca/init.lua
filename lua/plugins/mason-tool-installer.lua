return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
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
	end,
}
