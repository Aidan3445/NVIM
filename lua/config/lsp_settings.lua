require('mason').setup()
require('mason-lspconfig').setup()

vim.lsp.enable('ts_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('eslint')
vim.lsp.enable('tailwindcss')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('*', {
	capabilities = capabilities,
})

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none', fg = '#F5C2E7' })

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local map = function(keys, func, desc)
			vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'Lsp: ' .. desc })
		end

		local tele = require('telescope.builtin')
		map('gd', tele.lsp_definitions, 'Goto Definition')
		vim.keymap.set('n', '<leader>GD', function()
			vim.cmd('vsplit')
			vim.lsp.buf.definition()
		end, { noremap = true, silent = true })

		map('<leader>gr', tele.lsp_references, 'Goto References')
		map('<leader>gi', tele.lsp_implementations, 'Goto Impl')
		map('<leader>gt', tele.lsp_type_definitions, 'Goto Type')

		map('<leader>vca', vim.lsp.buf.code_action, 'code action')
		map('<leader>vrn', vim.lsp.buf.rename, 'rename')
		vim.keymap.set('v',
			'<leader>vca',
			vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Lsp: code_action' })

		map('K', function() vim.lsp.buf.hover({ border = 'rounded' }) end, 'hover')
		map('<leader>k', function() vim.lsp.buf.signature_help({ border = 'rounded' }) end, 'signature help')
		map('<leader>e', function() vim.diagnostic.open_float({ border = 'rounded' }) end, 'diagnostic')

		vim.keymap.set('n', '<leader>S', function()
			local ft = vim.bo.filetype
			if ft == "swift" or ft == "objective-c" or ft == "objective-cpp" then
				-- Use LSP formatting for Swift / Obj-C
				vim.lsp.buf.format({ async = true })
			else
				-- Use conform or any other tool for non-Swift files
				require("conform").format({ async = true, lsp_fallback = true })
			end
			vim.cmd('w')
			print('formatted')
		end, {
			buffer = ev.buf,
			desc = 'Lsp: format and save',
		})
	end,
})
