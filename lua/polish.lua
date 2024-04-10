-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.cmd [[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]
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
