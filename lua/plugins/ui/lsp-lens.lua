return {
  "VidocqH/lsp-lens.nvim",
  enabled = false,
  event = "LspAttach",
  config = function()
    require("lsp-lens").setup {}
    vim.api.nvim_set_hl(0, "LspLens", { link = "LspCodeLens" })
  end,
}
