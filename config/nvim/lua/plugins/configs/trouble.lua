local signs = require("utils").signs

require("trouble").setup {
    signs = {
        -- icons / text used for a diagnostic
        error = signs.Error,
        warning = signs.Warn,
        hint = signs.Hint,
        information = signs.Info,
        other = "﫠"
    },
}
