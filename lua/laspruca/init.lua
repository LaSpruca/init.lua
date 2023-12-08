-- Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugin install
vim.g.mapleader = " "

require("lazy").setup({
	{ "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "mfussenegger/nvim-lint" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "mhartington/formatter.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/nvim-cmp" },
			{ "L3MON4D3/LuaSnip", version = "2.1.1", build = "make install_jsregexp" },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "EdenEast/nightfox.nvim" },
	{ "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { { "nvim-lua/plenary.nvim" } } },
})

vim.cmd("colorscheme carbonfox")
require("harpoon"):setup()
require("telescope").setup({})

-- Set
require("laspruca.set")

-- Setup sidebar
require("laspruca.filetree")

-- Setup Treesitter
require("laspruca.treesitter")

-- Setup Mason and LSP
require("laspruca.lsp")

-- Setup formatter
require("laspruca.formatter")

-- Keybinds
require("laspruca.keyboard")
