return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
    },
    config = function()
      require "configs.lspconfig"
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end
          map("<leader>k", require("telescope.builtin").lsp_definitions, "[g]oto [d]efinition")
          map("f", vim.lsp.buf.hover, "Hover documentation")
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true)
          end



          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          -- if client and client.server_capabilities.documentHighlightProvider then
          --   local highlight_augroup = vim.api.nvim_create_augroup("Lsp-highlight", { clear = false })
          --   vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          --     buffer = event.buf,
          --     group = highlight_augroup,
          --     callback = vim.lsp.buf.document_highlight,
          --   })
          --
          --   vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          --     buffer = event.buf,
          --     group = highlight_augroup,
          --     callback = vim.lsp.buf.clear_references,
          --   })
          --
          --   vim.api.nvim_create_autocmd("LspDetach", {
          --     group = vim.api.nvim_create_augroup("Lsp-detach", { clear = true }),
          --     callback = function(event2)
          --       vim.lsp.buf.clear_references()
          --       vim.api.nvim_clear_autocmds { group = "Lsp-highlight", buffer = event2.buf }
          --     end,
          --   })
          -- end
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "markdown",
        "go",
        "rust"
      },
    },
  },

  {
    "williamboman/mason.nvim",
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
  -- {
  --   "rust-lang/rust.vim",
  --   ft = "rust",
  --   init = function()
  --     vim.g.rustfmt_autosave = 1
  --   end,
  -- },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require("cmp").setup.buffer {
        sources = {
          {
            name = "crates",
          },
        },
      }
    end,
  },
  {
    "okuuva/auto-save.nvim",
    -- cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
      -- your config goes here
      -- or just leave it empty :)
      debounce_delay = 10,
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
 {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "nvchad.configs.gitsigns"
    end,
  }, -- autopairing of (){}[] etc
      {    "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
 {
    "NvChad/nvim-colorizer.lua",
    event = "User FilePost",
    opts = {
      user_default_options = { names = false },
      filetypes = {
        "*",
        "!lazy",
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)

      dofile(vim.g.base46_cache .. "blankline")
    end,
  },
 {
    "github/copilot.vim",
    lazy = false,
    config = function() -- Mapping tab is already used in NvChad
      vim.g.copilot_no_tab_map = true; -- Disable tab mapping
      vim.g.copilot_assume_mapped = true; -- Assume that the mapping is already done
    end
  },
  {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "r",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "rr",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
},

}
