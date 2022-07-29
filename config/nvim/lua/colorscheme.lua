local _M = {}

local colors = {
    nord = {
        bg = "#2e3440",
        fg = "#ECEFF4",
        red = "#bf616a",
        orange = "#d08770",
        yellow = "#ebcb8b",
        blue = "#5e81ac",
        green = "#a3be8c",
        cyan = "#88c0d0",
        magenta = "#b48ead",
        bg0 = "#949fb5",
        bg1 = "#4C566A",
        bg2 = "#434C5E",
        bg3 = "#3B4252",
        bg4 = "#242932",
        bg5 = "#1e222a",
        bg6 = "#353D45",
    }
}
_M.colors = colors.nord


local _onenord, onenord = pcall(require, "onenord")

if not _onenord then
    return
end

onenord.setup {
    borders = true,
    fade_nc = false,
    styles = {
        comments = "italic",
        strings = "NONE",
        keywords = "italic",
        functions = "bold",
        variables = "none",
        diagnostics = "underline",
    },
    disable = {
        background = true,
        cursorline = true,
        eob_lines = true,
    },
}
return _M
