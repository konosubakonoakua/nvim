local custom = require "custom"

return {
  "p00f/clangd_extensions.nvim",
  event = {
    "BufRead *.c,*cpp,*cc,*cxx,*h,*hh,*hpp,*hxx",
    "BufNewFile *.c,*cpp,*cc,*cxx,*h,*hh,*hpp,*hxx",
  },
  opts = {
    server = {
      on_attach = function(client, bufnr)
        vim.keymap.set("n", "<localleader>t", "<cmd>ClangdAST<CR>", { buffer = bufnr, desc = "Show AST" })
        vim.keymap.set(
          "n",
          "<localleader><leader>",
          "<cmd>ClangdSwitchSourceHeader<CR>",
          { buffer = bufnr, desc = "Switch between source and header" }
        )
        vim.keymap.set(
          "n",
          "<localleader>h",
          "<cmd>ClangdTypeHierarchy<CR>",
          { buffer = bufnr, desc = "Show type hierarchy" }
        )
        vim.keymap.set(
          "n",
          "<localleader>m",
          "<cmd>ClangdMemoryUsage<CR>",
          { buffer = bufnr, desc = "Clangd memory usage" }
        )
      end,
    },
    memory_usage = {
      border = custom.border,
    },
    symbol_info = {
      border = custom.border,
    },
  },
}
