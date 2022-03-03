local vim = vim
local treesitter = require "nvim-treesitter.configs"

treesitter.setup {
  ensure_installed = "maintained",
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
  },
  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incrementnl = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true,
  },
  refactor = {
    smart_rename = {
      enable = false,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = false,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  endwise = {
    enable = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

vim.o.foldenable = false
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
