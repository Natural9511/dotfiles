return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			require("tokyonight").setup({
				transparent = true
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"kaiuri/nvim-juliana",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			--vim.cmd([[colorscheme juliana]])
		end,
	},
	-------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	--cursorline
	{
		"ya2s/nvim-cursorline",
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		commit = "4da89f3",
		--event = "VeryLazy",
		dependencies = {
			"neovim/nvim-lspconfig",
			{ "williamboman/mason-lspconfig.nvim", commit = "1a31f82" },
		},
		opts = {},
		config = function(_, opts)
			require("mason").setup(opts)
			local registry = require("mason-registry")

			local function setup(names, configs)
				local success, package = pcall(registry.get_package, names)
				if success and not package:is_installed() then
					package:install()
				end

				local lsp = require("mason-lspconfig.mappings.server").package_to_lspconfig[names]
				vim.lsp.config(lsp,configs)
				vim.lsp.enable(lsp)
			end

			setup("lua-language-server", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" , "love"},
						},
					},
				},
			})
			setup("gopls",{})
			setup("kotlin-language-server",{})
			setup("clangd",{})
			setup("python-lsp-server",{})
			setup("rust-analyzer",{})
			setup("bash-language-server",{})
			--setup("bash-language-server")
			--start LSP earily
			vim.cmd('LspStart')
		end,
	},

	--completion
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"moyiz/blink-emoji.nvim",
		},
		event = "VeryLazy",
		--require opts from plugins/blinkcmp.lua to config blinkcmp perform
		opts = require("plugins.opts.blinkcmp"),
	},
	{
		"stevearc/conform.nvim",
		--opts = {},
		--event = "BufWritePre",
		config = function()
			--install formatter
			local registry = require("mason-registry")
			local function installs(names)
				local success, package = pcall(registry.get_package, names)

				if success and not package:is_installed() then
					package:install()
				end
			end

			installs("stylua")
			installs("gofumpt")

			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "gofumpt" },
				},

				--format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				--	lsp_format = "fallback",
				--	timeout_ms = 500,
				--},
			})
		end,

		keys = {
			{
				"<leader>f",
				mode = { "v", "n" },
				function()
					require("conform").format()
				end,
				--desc = "formatting for normal and visual"
			},
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		cmd = "Lspsaga",
		opts = {},
		keys = {
			{ "<leader>lr", ":Lspsaga rename<CR>" },
			{ "<leader>ld", ":Lspsaga goto_definition<CR>" },
			{ "<leader>lh", ":Lspsaga hover_doc<CR>" },
			{ "<leader>lf", ":Lspsaga finder<CR>" },
			{ "<leader>t" , ":Lspsaga term_toggle<CR>"}
		},
		--lazy = false,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		--config = true,
		opts = {},
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
		keys = {
			{ "<leader>e", ":NvimTreeToggle<CR>" },
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		--	config = function()
		--		require("lualine").setup({
		--			options = {
		--				disabled_filetypes = {
		--					statusline = {},
		--				},
		--				ignore_focus = {"NvimTree"}
		--			},
		--		})
		--	end,
		opts = {
			options = {
				disabled_filetypes = {
					statusline = {},
				},
				ignore_focus = { "NvimTree" },
				--always_show_tabline = true,
				globalstatus = true,
			},
			sections = {
				lualine_c = { "filename","filesize" },
			},
		},
	},
}
