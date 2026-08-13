return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local servers = {
      "eslint",
      "clangd",
      "ts_ls",
      "tailwindcss",
      "gopls",
      "pyright",
    }

    for _, lsp in ipairs(servers) do
      vim.lsp.config(lsp, {})
      vim.lsp.enable(lsp)
    end

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
    })
    vim.lsp.enable("lua_ls")
  end,
}
