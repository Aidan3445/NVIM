return {
  { 'folke/neodev.nvim' },
  { 'folke/which-key.nvim' },
  { 'folke/neoconf.nvim',  cmd = 'Neoconf' },
  {
    'nvim-telescope/telescope.nvim',
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
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate'
  },
  { 'mbbill/undotree' },
  { 'tpope/vim-fugitive' },
  { 'github/copilot.vim' },
  { 'joelbeedle/pseudo-syntax' },
  { 'airblade/vim-gitgutter' },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
  {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = {
        comments = { "#", "//" },
        max_lookahead = 50,
      },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  }
}
