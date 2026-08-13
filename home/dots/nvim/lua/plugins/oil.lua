return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,

  config = function()
    require("oil").setup({
      default_file_explorer = true,

      float = {
        padding = 0,
        border = "none",
        override = function(conf)
          conf.width = vim.o.columns - 2
          conf.height = vim.o.lines - 2
          conf.row = 1
          conf.col = 1
          return conf
        end,
      },

      keymaps = {
        ["<CR>"] = "actions.select",
        ["q"] = "actions.close",
        ["<Esc>"] = "actions.close",
      },

      view_options = {
        show_hidden = true,
      },
    })

    vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open File Explorer" })
  end,
}
