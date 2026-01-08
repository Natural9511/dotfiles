return {
	keymap = {
		preset = 'enter',

		['<C-d>'] = { 'show', 'show_documentation', 'hide_documentation' },
		--		['<Tab>'] = { 'snippet_forward', 'fallback' },
		--		['<S-Tab>'] = { 'snippet_backward', 'fallback' },

		--	['<C-k>'] = { 'select_prev', 'fallback' },
		--	['<C-j>'] = { 'select_next', 'fallback' },
	},
	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		--nerd_font_variant = 'normal',
		--use_nvim_cmp_as_default = true,
		kind_icons = {
			--	Text = 'T',
			--	Method = 'M',
			--	Function = 'f',
		}
	},
	-- (Default) Only show the documentation popup when manually triggered
	completion = { --documentation = { auto_show = true },
		keyword = { range = 'full' },
		trigger = {
			--when true,will prefetch the completion items when entering insert mode
			--prefetch_on_insert = true,


			--when true,will show the completion windows after typing any 'alphanumberics'
			--show_on_keyword = true,


			--when false,will not show the completion windows automatically when in a 'snippet'
			--show_in_snippet = true,


			--when true,will show the completion window after typing a trigger character(for example,Lualsp 'table.*' '.' is trigger character)
			--show_on_trigger_character = true,


			--when this and show_on_trigger_character both true,will show completion window
			--when after accepting an items and the cursor come after a trigger character
			--for example '/usr/share/nano/' path
			--show_on_accept_on_trigger_character = true,


			--when this and show_on_trigger_character both true,will show completion window
			--when the cursor come after a trigger character  when entering the insert mode
			--show_on_insert_on_trigger_character = true,
		},
		list = {
			selection = {
				--disable to in a snippet

				--preselect = function (ctx)
				--	return not require("blink.cmp").snippet_active({direction = 1})
				--end,
				--preselect = true,


				--auto insert completion (default <C-e> cancel )
				--auto_insert = false,
			}
		},
		accept = {
			--dot_repeat = true,

			--create_undo_point = true,



			--how long to wait for LSP to resolve the items with additional information before continuing write
			resolve_timeout_ms = 100,


			--auto brackets for function
			auto_brackets = {

				--whether to auto-insert brackets for function
				--enabled = true,




				--default brackets for unknown languages
				--default_brackets = {'(',')'},







				--overrides the default brackets for block filetypes
				--override_brackets_for_filetypes={lua = {'{','}'}},
			}
		},
		menu = {
			--scrollbar = true,

			--control menu popout direction which base on cursor line
			--falling back to the next direction there's not enough space
			direction_priority = { 'n', 's' },
		},
		documentation = {
			--auto show the completion documentation when select the items
			--auto_show = true,
		},

		--display a preview of the selected item
		ghost_text = {
			enabled = false,
		},


	},


	fuzzy = {
		implementation = 'prefer_rust_with_warning',
		max_typos = function(keyword)
			return math.floor(#keyword / 4)
		end,
	},



	--signature help support
	signature = {
		enabled = true,
		trigger = {
			--show the signature help window after typing any alphanumberics
			show_on_keyword = true,

			--when this and 'show_on_trigger_character' both true ,the signature help window after entering insert mode
			show_on_insert = false,
		},
	},


	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji' },
		providers = {
			path = {
				opts = {
					--show hidden file ex ~/.config
					show_hidden_files_by_default = true
				}
			},
			emoji = {
				module = "blink-emoji",
				name = "Emoji",
				score_offset = 15, -- Tune by preference
				opts = { insert = true }, -- Insert emoji (default) or complete its name
				should_show_items = function()
					return vim.tbl_contains(
					-- Enable emoji completion only for git commits and markdown.
					-- By default, enabled for all file-types.
						{ "gitcommit", "markdown" },
					vim.o.filetype
					)
				end,
			}
		},
	},
	cmdline = {
		keymap = { ['<Tab>'] = { 'show', 'accept' } },
		completion = { menu = { auto_show = true } }
	},
}
