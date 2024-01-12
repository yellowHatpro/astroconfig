return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>td", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
    },
  },
  {
    "wakatime/vim-wakatime",
    event = "User AstroFile",
  },
  {
    "bjartek/nvim-cadence",
    event = "User AstroFile",
    config = function()
      -- i really like format on save and this does the trick:Wq
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.cdc" },
        command = ":normal gg=G''",
      })
      -- startup the cadence shared lspconfig
      require("lspconfig").cadence.setup {
        filetypes = { "cdc" },
        cmd = { "flow", "cadence", "language-server" },
      }
    end,
  },
}
