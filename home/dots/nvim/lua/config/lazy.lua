local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)
vim.opt.swapfile = false

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.lsp" }
  },
  lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      reset = false,
    },
  },
})

-- Treesitter setup has been moved to after/plugin/treesitter.lua
-- Reason: neovim loads pack/*/start packages (home-manager plugins) AFTER
-- init.lua completes. Calling require("nvim-treesitter.configs") here means
-- the module isn't in the lua path yet → "module not found" error.
-- after/plugin/ runs after ALL plugins are loaded, so it's safe there.
