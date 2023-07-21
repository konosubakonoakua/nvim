local custom = require "custom"

local opts = {
  source_selector = {
    winbar = true,
    sources = {
      {
        source = "filesystem",
        display_name = "  Files ",
      },
      {
        source = "buffers",
        display_name = "  Buffers ",
      },
      {
        source = "git_status",
        display_name = "  Git ",
      },
    },
  },
  default_component_configs = {
    container = {
      enable_character_fade = false,
    },
    git_status = {
      symbols = {
        added = "",
        modified = "",
        deleted = "",
        renamed = "",
        untracked = "",
        ignored = "",
        unstaged = "",
        staged = "",
        conflict = "",
      },
    },
  },
  window = {
    width = custom.width,
    mappings = {
      ["<space>"] = "none",
    },
  },
  filesystem = {
    group_empty_dirs = true,
  },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
  },
  opts = opts,
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File Explorer" },
  },
}
