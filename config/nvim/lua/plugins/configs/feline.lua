local _feline, feline = pcall(require, "feline")

if not _feline then
    return
end

local lsp = require "feline.providers.lsp"
local vi_mode_utils = require "feline.providers.vi_mode"
local git_utils = require "feline.providers.git"
local colors = require("colorscheme").colors
local signs = require("utils").signs
local powerline = require("utils").powerline.arrow

local vi_mode_colors = {
    ["NORMAL גּ"]= colors.cyan,
    ["INSERT הּ"]= colors.green,
    ["VISUAL 閭"] = colors.magenta,
    ["LINES 閭"] = colors.magenta,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.orange,
    ["V-REPLACE"] = colors.orange,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    ["SELECT 濾"] = colors.yellow,
    ["COMMAND "] = colors.orange,
    SHELL = colors.red,
    TERM = colors.red,
    NONE = colors.yellow,
}

local icons = {
    linux = " ",
    macos = "🐧 ",
    windows = " ",
    indent = "הּ",
    diagnostics = {
        errors = signs.Error,
        warns = signs.Warn,
        infos = signs.Info,
        hints = signs.Hint,
    },
    lsp = "",
    git = {
        branch = '',
        added = "烙",
        modified = "ﯽ ",
        removed = ""
    },
}

local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == "UNIX" then
        icon = icons.macos
    elseif os == "MAC" then
        icon = icons.macos
    else
        icon = icons.windows
    end
    return icon
end

local function get_lsp_diagnostics()
    return {
        errors = lsp.get_diagnostics_count "Error",
        warns = lsp.get_diagnostics_count "Warn",
        infos = lsp.get_diagnostics_count "Info",
        hints = lsp.get_diagnostics_count "Hint",
    }
end

local function render_diagnostics(fn, type)
    local icon = icons.diagnostics[type]
    return function()
        local diag = fn()[type]
        return icon .. " " .. diag
    end
end

local conditions = {
    diagnostic_enable = function(fn, type)
        return function()
            local diagnostics_count = fn()[type]
            return diagnostics_count and diagnostics_count ~= 0
        end
    end,
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand "%:t") ~= 1
    end,
    hide_in_width = function()
        local squeeze_width = vim.fn.winwidth(0) / 2
        if squeeze_width > 60 then
            return true
        end
        return false
    end,
}

local comps = {
    vi_mode = {
        sep = {
            left = {
                provider = " ",
                hl = function()
                    return {
                        name = vi_mode_utils.get_mode_highlight_name(),
                        bg = vi_mode_utils.get_mode_color(),
                    }
                end,
            },
            right = {
                provider = " ",
                hl = function()
                    return {
                        name = vi_mode_utils.get_mode_highlight_name(),
                        bg = vi_mode_utils.get_mode_color(),
                    }
                end,
            },
        },
        text = {
            provider = function()
                return vi_mode_utils.get_vim_mode() .. " "
            end,
            hl = function()
                return {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    bg = vi_mode_utils.get_mode_color(),
                    fg = colors.bg,
                    style = "bold",
                }
            end,
            left_sep = {
                str = " ",
                hl = function()
                    return {
                        bg = vi_mode_utils.get_mode_color(),
                        fg = colors.bg,
                    }
                end,
            },

            right_sep =  {
                str = powerline.right,
                hl = function()
                    return {
                        bg = colors.bg1,
                        fg = vi_mode_utils.get_mode_color(),
                    }
                end,
            }
        },
    },

    file = {
        info = {
            provider = "file_info",
            left_sep = {
                str = " ",
                hl = function()
                    return {
                        bg = colors.bg1
                    }
                end,
            },
            right_sep = {
                str = powerline.right .. " ",
                hl = function()
                    return {
                        fg = colors.bg1,
                    }
                end,
            },
            hl = {
                style = "bold",
                bg = colors.bg1,
                fg = colors.fg
            },
            enabled = conditions.buffer_not_empty,
        },
        winbar_info = {
            provider = "file_info",
            left_sep = " ",
            right_sep = " ",
            enabled = conditions.buffer_not_empty,
        },
        encoding = {
            provider = "file_encoding",
            left_sep = "",
            right_sep = " ",
            enabled = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width()
            end,
        },
        type = {
            provider = "file_type",
            left_sep = " ",
            right_sep = " ",
            enabled = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width()
            end,
        },
        os = {
            provider = file_osinfo,
            left_sep = " ",
            right_sep = " ",
            enabled = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width()
            end,
        },
        indent_size = {
            icon = "הּ",
            provider = function()
                return " " .. vim.opt.tabstop:get()
            end,
            left_sep = " ",
            right_sep = " ",
            enabled = conditions.buffer_not_empty,
        },
        size = {
            provider = "file_size",
            left_sep = " ",
            right_sep = " ",
            enabled = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width()
            end,
        },
        position = {
            provider = "position",
            left_sep = " ",
            right_sep = " ",
            enabled = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width()
            end,
        },
    },
    line_percentage = {
        provider = "line_percentage",
        left_sep = " ",
        right_sep = " ",
        enabled = function()
            return conditions.buffer_not_empty() and conditions.hide_in_width()
        end,
    },
    scroll_bar = {
        provider = "scroll_bar",
        enabled = function()
            return conditions.buffer_not_empty() and conditions.hide_in_width()
        end,
    },
    diagnostics = {
        error = {
            provider = render_diagnostics(get_lsp_diagnostics, "errors"),
            right_sep = " ",
            enabled = conditions.diagnostic_enable(get_lsp_diagnostics, "errors"),
            hl = {
                fg = colors.red,
            },
        },
        warn = {
            provider = render_diagnostics(get_lsp_diagnostics, "warns"),
            right_sep = " ",
            enabled = conditions.diagnostic_enable(get_lsp_diagnostics, "warns"),
            hl = {
                fg = colors.orange,
            },
        },
        info = {
            provider = render_diagnostics(get_lsp_diagnostics, "infos"),
            right_sep = " ",
            enabled = conditions.diagnostic_enable(get_lsp_diagnostics, "infos"),
            hl = {
                fg = colors.green,
            },
        },
        hint = {
            provider = render_diagnostics(get_lsp_diagnostics, "hints"),
            right_sep = " ",
            enabled = conditions.diagnostic_enable(get_lsp_diagnostics, "hints"),
            hl = {
                fg = colors.magenta,
            },
        },
    },
    lsp = {
        name = {
            provider = "lsp_client_names",
            left_sep = " ",
            right_sep = " ",
            icon = icons.lsp .. " ",
            hl = {
                fg = colors.green,
            },
        },
    },
    git = {
        branch = {
            provider = "git_branch",
            icon = icons.git.branch .. " ",
            hl = {
                fg = colors.magenta,
                bg = colors.bg4,
                style = "bold",
            },
            left_sep = {
                str = " ",
                hl = {
                    bg = colors.bg4,
                },
            },
            right_sep = {
                str = " ",
                hl = {
                    bg = colors.bg4,
                },
            },
        },
        add = {
            provider = "git_diff_added",
            hl = {
                fg = colors.green,
                bg = colors.bg4,
            },
            icon = icons.git.added,
            right_sep = {
                str = " ",
                hl = {
                    bg = colors.bg4,
                },
            },
        },
        change = {
            provider = "git_diff_changed",
            hl = {
                fg = colors.orange,
                bg = colors.bg4,
            },
            icon = icons.git.modified,
            right_sep = {
                str = " ",
                hl = {
                    bg = colors.bg4,
                },
            },
        },
        remove = {
            provider = "git_diff_removed",
            hl = {
                fg = colors.red,
                bg = colors.bg4,
            },
            icon = icons.git.removed,
            right_sep = {
                str = " ",
                hl = {
                    bg = colors.bg4,
                },
            },
        },
    },
    powerline = {
        left = {
            provider = function()
                if git_utils.git_info_exists() then
                    return powerline.left
                else
                    return ""
                end
            end,
            hl = {
                fg = colors.bg4,
            },
        },
    },
}

feline.setup {
    theme = {
        fg = colors.bg0,
        bg = colors.bg3,
    },
    highlight_reset_triggers = {},
    force_inactive = {
        {
            filetypes = {
                "^packer$",
                "^startify$",
                "^fugitive$",
                "^fugitiveblame$",
                "^qf$",
                "^help$",
            },
            buftypes = {
                "^terminal$",
            },
            bufnames = {},
        },
    },
    components = {
        active = {
            {
                comps.vi_mode.sep.left,
                comps.vi_mode.text,
                comps.file.info,
                comps.diagnostics.error,
                comps.diagnostics.warn,
                comps.diagnostics.hint,
                comps.diagnostics.info,
                comps.file.size,
                comps.file.position,
            },
            {
                comps.lsp.name,
                comps.file.os,
                comps.file.encoding,
                comps.file.indent_size,
                comps.powerline.left,
                comps.git.branch,
                comps.git.add,
                comps.git.change,
                comps.git.remove,
                comps.vi_mode.sep.right,
            },
        },
        inactive = {
            {
                comps.vi_mode.left,
                comps.vi_mode_text,
                comps.file.info,
            },
            {},
        },
    },
    vi_mode_colors = vi_mode_colors,
}
