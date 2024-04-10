-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },

  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  -- { import = "astrocommunity.editing-support.cutlass-nvim" },
  { import = "astrocommunity.editing-support.dial-nvim" },
  { import = "astrocommunity.editing-support.hypersonic-nvim" },
  { import = "astrocommunity.editing-support.multicursors-nvim" },
  { import = "astrocommunity.editing-support.suda-vim" },

  { import = "astrocommunity.motion.vim-matchup" },
  { import = "astrocommunity.motion.nvim-surround" },

  -- { import = "astrocommunity.colorscheme.gruvbox-baby" },
  -- { import = "astrocommunity.colorscheme.nord-nvim" },

  -- { import = "astrocommunity.utility.noice-nvim" },
  --
  -- { import = "astrocommunity.pack.python" },
  --
  { import = "astrocommunity.scrolling.cinnamon-nvim" },

  { import = "astrocommunity.file-explorer.oil-nvim" },

  -- { import = "astrocommunity.language.pantran-nvim" }, dev

  { import = "astrocommunity.register.nvim-neoclip-lua" },

  { import = "astrocommunity.workflow.hardtime-nvim" },
  {
    "hardtime.nvim",
    opts = {
      disable_mouse = false,
      max_count = 8,
      restriction_mode = "hint", -- block or hint
      disabled_keys = {},
    },
  },

  -- {
  --   "pantran-nvim",
  --
  --   require("pantran").setup {
  --     default_engine = "google",
  --     engines = {
  --       google = {
  --         default_source = "auto",
  --         default_target = "uk",
  --       },
  --     },
  --   },
  -- },
  --lua/astrocommunity//
  --lua/astrocommunity//
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  {
    "lsp_lines.nvim",
    vim.diagnostic.config { virtual_lines = false },
    config = function(_, opts)
      -- enable diagnostic virtual text
      local astrocore = require "astrocore"
      vim.diagnostic.config(astrocore.diagnostics[vim.g.diagnostics_mode])
      require("lsp_lines").setup(opts)
    end,
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>uD"] = false,
            },
          },
        },
      },
    },
  },
}
