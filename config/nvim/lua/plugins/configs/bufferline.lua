local _bufferline, bufferline = pcall(require, "bufferline")

if not _bufferline then
    return
end

local colors = require("colorscheme").colors

bufferline.setup {
    options = {
        mode = "buffers",
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator_icon = "",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        name_formatter = function(buf)
            if buf.name:match "%.md" then
                return vim.fn.fnamemodify(buf.name, ":t:r")
            end
        end,
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 24,
        diagnostics = false,
        offsets = { { filetype = "NvimTree", text = "File Expoler" } },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_buffer_default_icon = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = { "|", "" },
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = "insert_at_end",
    },
    highlights = {
        fill = {
            guifg = colors.fg,
            guibg = colors.bg,
        },
        background = {
            guifg = colors.bg0,
            guibg = colors.bg,
        },
        buffer_visible = {
            guifg = colors.bg0,
            guibg = colors.bg,
        },
        buffer_selected = {
            gui = "bold",
            guifg = colors.magenta,
            guibg = colors.bg,
        },
        separator = {
            guifg = colors.cyan,
            guibg = colors.bg,
        },
        separator_selected = {
            guifg = colors.cyan,
            guibg = colors.bg,
        },
        separator_visible = {
            guifg = colors.cyan,
            guibg = colors.bg,
        },
        close_button = {
            guifg = colors.red,
            guibg = colors.bg,
        },
        duplicate = {
            guifg = colors.bg,
            guibg = colors.bg,
        },
        duplicate_selected = {
            guifg = colors.fg,
            gui = "italic",
            guibg = colors.bg,
        },
        duplicate_visible = {
            guifg = colors.fg,
            gui = "italic",
            guibg = colors.bg,
        },
        indicator_selected = {
            guifg = colors.cyan,
            guibg = colors.bg,
        },
        modified = {
            guifg = colors.bg1,
            guibg = colors.bg,
        },
        modified_visible = {
            guifg = colors.green,
            guibg = colors.bg,
        },
        modified_selected = {
            guifg = colors.green,
            guibg = colors.bg,
        },
    },
}
