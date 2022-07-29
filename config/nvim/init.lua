require "utils"
require "options"
require "colorscheme"
require "plugins"
require "mappings"
require "lsp"
require "autocmds"

local _impatient, impatient = pcall(require, "impatient")
if _impatient then
    impatient.enable_profile()
end
