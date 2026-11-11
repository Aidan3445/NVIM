local ensure_installed = {
  "typescript", "javascript", "cpp", "c_sharp", "rust", "python", "c", "lua",
  "vim", "vimdoc", "query", "markdown", "markdown_inline",
}

require("nvim-treesitter").install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
