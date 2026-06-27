vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/mbbill/undotree" },
  { src = "https://github.com/EdenEast/nightfox.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim.git" },
  { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim.git" },
  { src = "https://github.com/nvim-lua/plenary.nvim.git" },
  { src = "https://github.com/ThePrimeagen/harpoon.git", version = "harpoon2" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
  { src = "https://github.com/malewicz1337/oil-git.nvim.git" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/mason-org/mason.nvim.git" },
  { src = "https://github.com/neovim/nvim-lspconfig.git" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim.git" },
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/nvim-mini/mini.pairs.git" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },
  { src = "https://github.com/windwp/nvim-ts-autotag.git" },
  { src = "https://github.com/j-hui/fidget.nvim.git" },
  { src = "https://github.com/Myriad-Dreamin/tinymist.git" },
})
require("oil").setup()
require("oil-git").setup()
require("mason").setup()
require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<Tab>"] = { "select_and_accept", "fallback" },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = {
    implementation = "lua",
  },
  completion = {
    menu = {
      border = "none",
    },
    documentation = {
      auto_show = true,
    },
  },
  signature = {
    enabled = true,
  },
  cmdline = {
    enabled = false,
  },
})
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("clangd", {
  capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.config("pyright", {
  capabilities = capabilities,
})

vim.lsp.config("rust_analyzer", {
  capabilities = capabilities,
})

vim.lsp.config("tinymist", {
  capabilities = capabilities,
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "tinymist",
  },
  automatic_enable = {
    "clangd",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "tinymist",
  },
})
require("telescope").setup({
  defaults = {
    preview = { treesitter = true },
    color_devicons = true,
    sorting_strategy = "ascending",
    borderchars = {
      "", -- top
      "", -- right
      "", -- bottom
      "", -- left
      "", -- top-left
      "", -- top-right
      "", -- bottom-right
      "", -- bottom-left
    },
    path_displays = { "smart" },
    layout_config = {
      height = 100,
      width = 400,
      prompt_position = "bottom",
      preview_cutoff = 45,
    },
  },
})
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
require("harpoon").setup()
require("mini.pairs").setup()
require("ibl").setup()
require("nvim-ts-autotag").setup()
require("fidget").setup({})

vim.cmd("colorscheme carbonfox")
