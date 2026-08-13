return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-mini/mini.icons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        section_separators = "",
        component_separators = "",
        icons_enabled = true,
        globalstatus = true,
      },

      tabline = {
        lualine_a = { { "tabs", mode = 2 } },
        lualine_b = { "buffers" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },

      sections = {
        lualine_a = { { "mode", icon = "🦚" } },
        lualine_b = { { "branch", icon = "󰊢 " } },
        lualine_c = { { "filename", path = 1, icon = "🎸" } },
        lualine_x = {
          { "diagnostics", sources = { "nvim_diagnostic" }, symbols = { error = " ", warn = " ", info = " " } },
          { "filetype", icon_only = true },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
