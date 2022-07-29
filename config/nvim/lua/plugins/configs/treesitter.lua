local _treesitter, treesitter = pcall(require, "nvim-treesitter.configs")

if not _treesitter then
    return
end

local colors = require("colorscheme").colors

treesitter.setup {
    autotag = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
    rainbow = {
        colors = {
            colors.magenta,
            colors.cyan,
            colors.green,
            colors.blue,
            colors.yellow,
            colors.cyan,
            colors.magenta,
        },
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["ap"] = "@parameter.outer",
                ["ip"] = "@parameter.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}
