return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  event = "VeryLazy",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter" },
  },
  config = function()
    require("nvim-treesitter.configs").setup {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["aa"] = { query = "@parameter.outer", desc = "a argument" },
            ["ia"] = { query = "@parameter.inner", desc = "inner part of a argument" },
            ["af"] = { query = "@function.outer", desc = "a function region" },
            ["if"] = { query = "@function.inner", desc = "inner part of a function region" },
            ["ac"] = { query = "@class.outer", desc = "a of a class" },
            ["ic"] = { query = "@class.inner", desc = "inner part of a class region" },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]a"] = { query = "@parameter.outer", desc = "Next argument start" },
            ["]f"] = { query = "@function.outer", desc = "Next function start" },
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
          },
          goto_next_end = {
            ["]A"] = { query = "@parameter.outer", desc = "Next argument end" },
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
            ["]C"] = { query = "@class.outer", desc = "Next class end" },
          },
          goto_previous_start = {
            ["[a"] = { query = "@parameter.outer", desc = "Previous argument start" },
            ["[f"] = { query = "@function.outer", desc = "Previous function start" },
            ["[c"] = { query = "@class.outer", desc = "Previous class start" },
          },
          goto_previous_end = {
            ["[A"] = { query = "@parameter.outer", desc = "Previous argument end" },
            ["[F"] = { query = "@function.outer", desc = "Previous function end" },
            ["[C"] = { query = "@class.outer", desc = "Previous class end" },
          },
        },
      },
    }
  end,
}
