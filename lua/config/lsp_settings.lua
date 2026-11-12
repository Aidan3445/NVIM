require('mason').setup()
require('mason-lspconfig').setup()

-- Only start sourcekit for Swift/Obj-C buffers (root_dir + capabilities come from
-- nvim-lspconfig's lsp/sourcekit.lua). Previously it was started for every session.
vim.lsp.config('sourcekit', {
  cmd = { 'xcrun', 'sourcekit-lsp' },
  filetypes = { 'swift', 'objc', 'objcpp' },
})
vim.lsp.enable('sourcekit')

-- harper (grammar checker) is auto-enabled by mason-lspconfig for ~every filetype;
-- keep it to prose so it isn't re-linting every code buffer.
vim.lsp.config('harper_ls', {
  filetypes = { 'markdown', 'text', 'gitcommit' },
})

vim.lsp.enable('ts_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('eslint')
vim.lsp.enable('tailwindcss')

-- Pyright .venv support
vim.lsp.config('pyright', {
  before_init = function(_, config)
    local venv_python = config.root_dir and (config.root_dir .. '/.venv/bin/python')
    if venv_python and vim.uv.fs_stat(venv_python) then
      config.settings.python = vim.tbl_deep_extend('force', config.settings.python or {},
        { pythonPath = venv_python })
    end
  end,
})

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

    map('<leader>vca', function()
      vim.lsp.buf.code_action({
        filter = function(action) return not action.disabled end,
      })
    end, 'code action')
    map('<leader>vrn', vim.lsp.buf.rename, 'rename')
    vim.keymap.set('v',
      '<leader>vca',
      function()
        vim.lsp.buf.code_action({
          filter = function(action) return not action.disabled end,
        })
      end, { buffer = ev.buf, desc = 'Lsp: code_action' })

    map('K', function() vim.lsp.buf.hover({ border = 'rounded' }) end, 'hover')
    map('<leader>k', function() vim.lsp.buf.signature_help({ border = 'rounded' }) end, 'signature help')
    map('<leader>e', function() vim.diagnostic.open_float({ border = 'rounded' }) end, 'diagnostic')

    vim.keymap.set('n', '<leader>S', function()
      local ft = vim.bo.filetype
      if ft == "swift" or ft == "objc" or ft == "objcpp" then
        -- Use conform for Swift / Obj-C
        ---@diagnostic disable-next-line: different-requires
        require("conform").format({ async = false, lsp_fallback = true })
      else
        -- Use LSP for other languages
        vim.lsp.buf.format({ async = false })
      end
      -- Save the file after formatting
      vim.cmd('w')
      print('formatted')
    end, {
      buffer = ev.buf,
      desc = 'Lsp: format and save',
    })
  end,
})
