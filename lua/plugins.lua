return {
  { 'folke/neodev.nvim' },
  { 'folke/which-key.nvim' },
  { 'folke/neoconf.nvim',  cmd = 'Neoconf' },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'BurntSushi/ripgrep' },
    }
  },
  { 'mason-org/mason.nvim',       opts = {} },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {},
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      { 'neovim/nvim-lspconfig' }
    }
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'rafamadriz/friendly-snippets',
    }
  },
  { 'folke/tokyonight.nvim' },
  { 'norcalli/nvim-colorizer.lua' },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',   -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      { '3rd/image.nvim', opts = {} }, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false,                      -- neo-tree will lazily load itself
    opts = {
      -- fill any relevant options here
    },
  },
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { 'nvim-treesitter/nvim-treesitter', branch = 'main', lazy = false, build = ':TSUpdate' },
  { 'nvim-treesitter/playground' },
  { 'mbbill/undotree' },
  { 'tpope/vim-fugitive' },
  { 'github/copilot.vim' },
  { 'joelbeedle/pseudo-syntax' },
  { 'airblade/vim-gitgutter' },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
}
