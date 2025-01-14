return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local gitsigns = require "gitsigns"
    local custom = require "custom"

    gitsigns.setup {
      word_diff = true,
      preview_config = {
        border = custom.border,
      },
      on_attach = function(bufnr)
        local next_integrations = require "nvim-next.integrations"
        local ngs = next_integrations.gitsigns(gitsigns)

        -- Navigation
        vim.keymap.set("n", "]h", function()
          if vim.wo.diff then
            return "]h"
          end
          vim.schedule(function()
            ngs.next_hunk()
          end)
          return "<Ignore>"
        end, { buffer = bufnr, expr = true, desc = "Next hunk" })

        vim.keymap.set("n", "[h", function()
          if vim.wo.diff then
            return "[h"
          end
          vim.schedule(function()
            ngs.prev_hunk()
          end)
          return "<Ignore>"
        end, { buffer = bufnr, expr = true, desc = "Previous hunk" })

        -- Actions
        vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
        vim.keymap.set("v", "<leader>gs", function()
          gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { buffer = bufnr, desc = "Stage hunk" })
        vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
        vim.keymap.set("v", "<leader>gr", function()
          gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { buffer = bufnr, desc = "Reset hunk" })
        vim.keymap.set("n", "<leader>gu", gitsigns.undo_stage_hunk, { buffer = bufnr, desc = "Undo stage hunk" })
        vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })
        vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })
        vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
        vim.keymap.set("n", "<leader>gb", function()
          gitsigns.blame_line { full = true }
        end, { buffer = bufnr, desc = "Blame line" })

        vim.keymap.set("n", "<leader>td", gitsigns.toggle_deleted, { buffer = bufnr, desc = "Deleted" })
        vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = "Line Blame" })

        -- Text object
        vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        vim.keymap.set({ "o", "x" }, "ah", ":<C-U>Gitsigns select_hunk<CR>")
      end,
    }

    local function set_hl()
      vim.api.nvim_set_hl(0, "GitSignsChangeLn", { link = "DiffText" })
      vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { link = "DiffDelete" })

      vim.api.nvim_set_hl(0, "GitSignsAddInline", { link = "GitSignsAddLn" })
      vim.api.nvim_set_hl(0, "GitSignsDeleteInline", { link = "GitSignsDeleteLn" })
      vim.api.nvim_set_hl(0, "GitSignsChangeInline", { link = "GitSignsChangeLn" })
    end

    set_hl()

    vim.api.nvim_create_autocmd("ColorScheme", {
      desc = "Set gitsigns highlights",
      callback = set_hl,
    })
  end,
}
