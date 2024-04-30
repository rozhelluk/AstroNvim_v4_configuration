-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- disable auto-comment new line
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- vim.cmd [[au BufWritePost * mksession!]]

-- remove line lenght marker for selected filetypes
vim.cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- 2 spaces for selected filetypes
vim.cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]

vim.cmd [[autocmd FileType htmldjango set filetype=html]]


-- format jinja2 syntax at html files.
-- vim.cmd [[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]

-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

-- replace icons
-- local icons = require "astronvim.icons.nerd_font"
-- local text_icons = require "astronvim.icons.text"
-- icons.DiagnosticError = text_icons.DiagnosticError
-- icons.DiagnosticHint = text_icons.DiagnosticHint
-- icons.DiagnosticInfo = text_icons.DiagnosticInfo
-- icons.DiagnosticWarn = text_icons.DiagnosticWarn
-- icons.GitUnstaged = text_icons.GitUnstaged
-- icons.GitUntracked = text_icons.GitUntracked
-- icons.GitRenamed = text_icons.GitRenamed
-- icons.Selected = text_icons.Selected
