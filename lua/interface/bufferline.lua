local ok, bufferline = pcall(require, "bufferline")
if not ok then
  vim.notify "Could not load bufferline"
  return
end

bufferline.setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = "▎",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match "%.md" then
        return vim.fn.fnamemodify(buf.name, ":t:r")
      end
    end,
    max_name_length = 24,
    max_prefix_length = 20, -- prefix used when a buffer is de-duplicated
    tab_size = 24,
    diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "(" .. count .. ")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number, buf_numbers)
      -- Show buffers if they are in the current tabpage
      if vim.tbl_contains(vim.fn.tabpagebuflist(), buf_number) then
        return true
      end

      -- Show buffers if they are modified
      if vim.bo[buf_number].modified then
        return true
      end
    end,
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", text_align = "center" },
      { filetype = "Outline", text = "Outline", text_align = "center" },
      { filetype = "neo-tree", text = "File Explorer", text_align = "center" },
      { filetype = "aerial", text = "Outline", text_align = "center" },
      { filetype = "packer", text = "Plugin Manager", text_align = "center" },
      { filetype = "dbui", text = "Database Manager", text_align = "center" },
      { filetype = "SidebarNvim", text = "Sidebar", text_align = "center" },
    },
    color_icons = true, --- true | false, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- true | false, -- disable filetype icons for buffers
    show_buffer_close_icons = true, -- true | false,
    show_buffer_default_icon = true, -- true | false, -- whether or not an unrecognised filetype should show a default icon
    show_close_icon = false, -- true | false,
    show_tab_indicators = true, -- true | false,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = false, -- false | true,
    always_show_bufferline = true, -- true | false,
    sort_by = "id", -- 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  },
}

vim.keymap.set("n", "<M-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" })
vim.keymap.set("n", "<M-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" })
vim.keymap.set("n", "<M-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" })
vim.keymap.set("n", "<M-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4" })
vim.keymap.set("n", "<M-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to buffer 5" })
vim.keymap.set("n", "<M-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go to buffer 6" })
vim.keymap.set("n", "<M-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "Go to buffer 7" })
vim.keymap.set("n", "<M-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "Go to buffer 8" })
vim.keymap.set("n", "<M-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "Go to buffer 9" })

vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<CR>", { desc = "Buffer" })
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { desc = "Buffer" })

vim.keymap.set("n", "gb", "<cmd>BufferLinePick<CR>", { desc = "Buffer" })

vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Close" })
vim.keymap.set("n", "<leader>bse", "<cmd>BufferLineSortByExtension<CR>", { desc = "By extension" })
vim.keymap.set("n", "<leader>bsd", "<cmd>BufferLineSortByDirectory<CR>", { desc = "By directory" })
vim.keymap.set("n", "<leader>bst", "<cmd>BufferLineSortByTabs<CR>", { desc = "By tabs" })
