-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        number = true, -- sets vim.opt.number
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        autochdir = true,
        relativenumber = true,
        spell = true,
        wrap = true,
        colorcolumn = "80,120",
        swapfile = false,
        encoding = "UTF-8",
        fileencoding = "UTF-8",
        tabstop = 4,
        showtabline = 2,
        laststatus = 0,
        scrolloff = 4,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        cmp_enabled = true,
        autopairs_enabled = true,
        diagnostics_mode = 3, -- (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        status_diagnostics_enabled = true,
        autoformat_enabled = false,
        mkdp_auto_start = 0,
        mkdp_auto_close = 1,
        mkdp_echo_preview_url = 1,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        ["<Leader>,"] = {
          function() require("notify").dismiss { pending = true, silent = true } end,
          desc = "Dismiss notifications",
        },
        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        [";"] = { ":" },
        ["<M-l>"] = {
          function() vim.diagnostic.open_float() end,
          desc = "Hover diagnostics",
        },

        ["<M-k>"] = {
          function()
            vim.diagnostic.config {
              virtual_text = not require("lsp_lines").toggle(),
            }
          end,
          desc = "Toggle virtual diagnostic lines",
        },
        -- ["<leader>n"] = { ":ASToggle<CR>", desc = "Toggle autosave" },
        ["<F2>"] = { "<cmd>!toggle_vim_opacity.sh<cr><cr>", desc = "toggle vim opacity" },
        ["<F3>"] = { "<cmd>!set_alacritty_opacity.sh<cr><cr>", desc = "toggle alacritty opacity" },
        ["<F5>"] = { ":w<CR>:exec '!python3 -B' shellescape(@%, 1)<CR>" },
        ["<F4>"] = { ":w<CR>:vsplit term://python3 -B %<cr>i" },
        ["<F8>"] = { ":w<CR>:exec '!g++ -Wall % && ./a.out' shellescape(@%, 1)<CR>" },
        ["<F9>"] = { ":w<CR>:vsplit term://g++ -Wall % && ./a.out<cr>i" },
        -- ["<F6>"] = { "vim.bo.filetype" },
      },
      i = {
        ["<F5>"] = { ":w<CR>:exec '!python3.11 -B' shellescape(@%, 1)<CR>" },
        ["<F4>"] = { ":w<CR>:vsplit term://python3.11 -B %<cr>i" },
      },
      t = {
        -- ["<esc>"] = false,
        ["<F5>"] = false,
        ["<F17>"] = false,
        ["<F29>"] = false,
        ["<F6>"] = false,
        ["<F9>"] = false,
        ["<F10>"] = false,
        ["<F11>"] = false,
        ["<F23>"] = false,
      },
      v = {
        ["y"] = { "ygv" },
        ['"'] = { 'xi"<esc>pa"<esc>' },
        ["'"] = { "xi'<esc>pa'<esc>" },
        ["v["] = { "xi[<esc>pa]<esc>" },
        ["v]"] = { "xi[<esc>pa]<esc>" },
        ["v{"] = { "xi{<esc>pa}<esc>" },
        ["v}"] = { "xi{<esc>pa}<esc>" },
        ["("] = { "xi(<esc>pa)<esc>" },
        [")"] = { "xi(<esc>pa)<esc>" },
      },
    },
  },
}
