-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  {
    "jake-stewart/jfind.nvim",
    branch = "2.0",
    keys = {
      {
        "<c-f>",
        function()
          local Key = require "jfind.key"
          require("jfind").findFile {
            formatPaths = true,
            hidden = true,
            queryPosition = "top",
            preview = true,
            previewPosition = "right",
            callback = {
              [Key.DEFAULT] = vim.cmd.edit,
              [Key.CTRL_S] = vim.cmd.split,
              [Key.CTRL_V] = vim.cmd.vsplit,
            },
          }
        end,
      },
      {
        "<c-g>",
        function()
          local key = require "jfind.key"
          local jfind = require "jfind"
          require("jfind").liveGrep {
            hidden = true, -- grep hidden files/directories
            caseSensitivity = "smart", -- sensitive, insensitive, smart
            --     will use vim settings by default
            preview = true,
            previewPosition = "right",
            queryPosition = "top",
            callback = {
              [key.DEFAULT] = jfind.editGotoLine,
              [key.CTRL_B] = jfind.splitGotoLine,
              [key.CTRL_N] = jfind.vsplitGotoLine,
            },
          }
        end,
      },
    },
    config = function()
      require("jfind").setup {
        exclude = {
          ".git",
          ".idea",
          ".vscode",
          ".sass-cache",
          ".class",
          "__pycache__",
          "node_modules",
          "target",
          "build",
          "tmp",
          "assets",
          "dist",
          "public",
          "*.iml",
          "*.meta",
        },
        windowBorder = false,
        tmux = true,
      }
    end,
  },
  {
    "andweeb/presence.nvim",
    config = function(_, opts)
      require("presence").setup {
        auto_update = true,
        neovim_image_text = "The One True Text Editor",
        main_image = "neovim", --(either "neovim" or "file")
        client_id = "793271441293967371",
        log_level = nil, --("debug", "info", "warn", "error")
        debounce_timeout = 10,
        enable_line_number = true,
        blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        show_time = true,

        editing_text = "Editing...", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      }
    end,

    event = "VeryLazy",
  },
  -- == Examples of Adding Plugins ==
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("htmldjango", { "html" })
    end,
  },

  -- == Examples of Overriding Plugins ==

  -- You can disable default plugins as follows:
  { "goolord/alpha-nvim", enabled = false },
  { "Shatur/neovim-session-manager", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
