-- vim.opt.guicursor = " "

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.g.netrw_altv = true
vim.g.netrw_winsize = 80

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

-- set leader key to space
vim.g.mapleader = " "

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#ad83af" })

vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-line)')
vim.keymap.set('i', '<C-k>', '<Plug>(copilot-accept-word)')
vim.keymap.set('i', '<C-n>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<C-p>', '<Plug>(copilot-previous)')
vim.keymap.set('i', '<C-m>', '<Plug>(copilot-suggest)')
vim.keymap.set('i', '<C-j>', '<Plug>(copilot-dismiss)')


vim.opt.spelllang = 'en_us'
vim.opt.spell = true
