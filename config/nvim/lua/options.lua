local utils = require "utils"

vim.g.mapleader = " "

vim.cmd [[set fcs=eob:\ ]]
vim.cmd [[filetype plugin indent on]]
vim.cmd [[hi cursorLineNr guifg=#EBCb8B]]
vim.cmd [[
    hi TelescopePreviewTitle guibg=#a3be8c guifg=#2e3440 gui=italic
    hi TelescopePromptTitle guibg=#bf616a guifg=#2e3440 gui=italic
    hi TelescopeResultsTitle guibg=#ebcb8b guifg=#2e3440 gui=italic
]]

local options = {
    termguicolors = true,
    fileencoding = "utf-8",
    autoread = true,
    wrap = true,
    backup = false,
    swapfile = false,
    hlsearch = false,
    incsearch = true,
    showmode = false,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    scrolloff = 5,
    autoindent = true,
    smartindent = true,
    sidescrolloff = 5,
    signcolumn = "yes",
    hidden = true,
    ignorecase = true,
    timeoutlen = 1000,
    shiftround = true,
    smartcase = true,
    splitbelow = true,
    splitright = true,
    number = true,
    relativenumber = true,
    clipboard = "unnamedplus",
    cursorline = true,
    mouse = "a",
    cmdheight = 1,
    undodir = "/tmp/.nvimdid",
    undofile = true,
    pumheight = 10,
    laststatus = 3,
    updatetime = 450,
    background = "dark",
    guifont = "Liga SFMono Nerd Font:h11",
}

vim.opt.shortmess:append "c"

for option, value in pairs(options) do
    vim.opt[option] = value
end

utils.set_indent_sizes {
    ["c"] = 4,
    ["cpp"] = 4,
    ["c#"] = 4,
    ["lua"] = 4,
    ["rust"] = 4,
}
