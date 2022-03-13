local vim = vim
local ok, lualine = pcall(require, "lualine")
if not ok then
  vim.notify "Could not load lualine"
  return
end

local ok, gps = pcall(require, "nvim-gps")
if not ok then
  return
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local function indent()
  if vim.o.expandtab then
    return "SW:" .. vim.o.shiftwidth
  else
    return "TS:" .. vim.o.tabstop
  end
end

lualine.setup {
  sections = {
    lualine_b = {
      { "b:gitsigns_head", icon = "" },
      { "diff", source = diff_source },
      "diagnostics",
    },
    lualine_c = {
      { gps.get_location, cond = gps.is_available },
    },
    lualine_x = {
      "copilot",
      "filetype",
      indent,
      "encoding",
      "fileformat",
    },
  },
  options = {
    theme = vim.g.colors_name,
    disabled_filetypes = {
      "alpha",
    },
    section_separators = "",
    component_separators = "│",
  },
  extensions = {
    "nvim-tree",
    "toggleterm",
    "symbols-outline",
    "aerial",
  },
}