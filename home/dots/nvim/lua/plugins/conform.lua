return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Lazy load when opening a file
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        nix = { "nixfmt" },
        bash = { "shfmt" },
        sh = { "shfmt" },
        lua = { "stylua" },
        python = { "isort", "black" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        go = { "goimports", "gofmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
      }
    })

    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format current buffer or selection" })
  end,
}
