local ok, ls = pcall(require, "null-ls")
if not ok then
  vim.notify "Could not load null-ls"
  return
end

local os, mason = pcall(require, "mason-null-ls")

mason.setup {
  automatic_setup = true,
}

ls.setup {
  sources = {
    ls.builtins.formatting.prettier,
    ls.builtins.formatting.stylua,
    ls.builtins.formatting.black,
    ls.builtins.formatting.isort,
    -- ls.builtins.diagnostics.pylint,
    -- ls.builtins.diagnostics.codespell,
    ls.builtins.formatting.shfmt,
  },
}
