return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  opts = {
    disable_commit_confirmation = true,
    kind = "replace",
    integrations = {
      diffview = true,
    },
    sections = {
      stashes = {
        folded = false,
      },
      unpulled = {
        folded = false,
      },
      recent = {
        folded = false,
      },
    },
  },
  keys = {
    { "<leader>gg", "<Cmd>Neogit<CR>", desc = "Open Neogit" },
  },
}
