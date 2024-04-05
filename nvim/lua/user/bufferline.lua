-- nord colorscheme
-- local highlights = require("nord").bufferline.highlights({
--     italic = false,
--     bold = true,
--     fill = "#181c24"
-- })
--
-- require("bufferline").setup({
--     options = {
--         separator_style = "slant",
--     },
--     highlights = highlights,
-- })


local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
  },
}
