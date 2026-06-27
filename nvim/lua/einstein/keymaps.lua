local opts = { noremap = true, silent = false }
local map = vim.keymap.set

-- map("n", "<leader>o", ":update<CR>:source<CR>", opts)
map("n", "<leader>v", ":vsplit<CR>", opts)

map("n", "<C-F>", "<Cmd>Open .<CR>", opts)
map("n", "<leader>pp", "<Cmd>Oil<CR>", opts)
map("n", "<leader>u", "<Cmd>UndotreeToggle<CR>", { desc = "[T]oggle [U]ndotree" })

map("n", "<leader>f", "<Cmd>Telescope find_files<CR>", opts)
-- map("n", "<leader>r", "<Cmd>Telescope buffers<CR>", opts)
map("n", "<leader>g", "<Cmd>Telescope live_grep<CR>", opts)

local telescope_builtin = require("telescope.builtin")
local telescope_themes = require("telescope.themes")
local dev_dir = vim.fn.expand("~/dev")

map("n", "<leader>sh", telescope_builtin.help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sk", telescope_builtin.keymaps, { desc = "[S]earch [K]eymaps" })
map("n", "<leader>sf", function()
  telescope_builtin.find_files({
    cwd = dev_dir,
  })
end, { desc = "[S]earch [F]iles in Code folder" })
map("n", "<leader>ss", telescope_builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
map("n", "<leader>sw", telescope_builtin.grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", function()
  telescope_builtin.live_grep({
    cwd = dev_dir,
  })
end, { desc = "[S]earch by [G]rep" })
map("n", "<leader>G", telescope_builtin.git_commits, { desc = "Pick through Git commits" })
map("n", "<leader>sd", telescope_builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", telescope_builtin.resume, { desc = "[S]earch [R]esume" })
map("n", "<leader>s.", telescope_builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
map("n", "<leader><leader>", telescope_builtin.buffers, { desc = "[ ] Find existing buffers" })
map("n", "<leader>/", function()
  telescope_builtin.current_buffer_fuzzy_find(telescope_themes.get_dropdown({
    winblend = 5,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })
map("n", "<leader>s/", function()
  telescope_builtin.live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end, { desc = "[S]earch [/] in Open Files" })
map("n", "<leader>sn", function()
  telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

map("n", "<leader>h", ":vert res -5<CR>", opts)
map("n", "<leader>j", ":res -5<CR>", opts)
map("n", "<leader>k", ":res +5<CR>", opts)
map("n", "<leader>l", ":vert res +5<CR>", opts)

-- map({ "n", "v", "x" }, ";", ":", opts)

map("n", "<Esc>", "<cmd>noh<CR>", opts)

map("n", "<leader>la", vim.lsp.buf.code_action, opts)
map("n", "<leader>lf", vim.lsp.buf.format, opts)
map("n", "<leader>ld", vim.diagnostic.open_float, opts)
map("n", "<leader>lt", vim.diagnostic.setloclist, opts)
map("n", "<leader>li", vim.lsp.buf.implementation, opts)
map("n", "<leader>lr", vim.lsp.buf.references, opts)

map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gD", vim.lsp.buf.declaration, opts)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("einstein-lsp-telescope-keymaps", { clear = true }),
  callback = function(event)
    local function lsp_map(keys, func, desc, mode)
      mode = mode or "n"
      map(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    lsp_map("grr", telescope_builtin.lsp_references, "[G]oto [R]eferences")
    lsp_map("gri", telescope_builtin.lsp_implementations, "[G]oto [I]mplementation")
    lsp_map("gd", telescope_builtin.lsp_definitions, "[G]oto [D]efinition")
    lsp_map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    lsp_map("gO", telescope_builtin.lsp_document_symbols, "Open Document Symbols")
    lsp_map("gW", telescope_builtin.lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
    lsp_map("grt", telescope_builtin.lsp_type_definitions, "[G]oto [T]ype Definition")
  end,
})

local harpoon = require("harpoon")

map("n", "<leader>a", function()
  harpoon:list():add()
end, opts)
map("n", "<leader>A", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, opts)
map("n", "<leader>1", function()
  harpoon:list():select(1)
end, opts)
map("n", "<leader>2", function()
  harpoon:list():select(2)
end, opts)
map("n", "<leader>3", function()
  harpoon:list():select(3)
end, opts)
map("n", "<leader>4", function()
  harpoon:list():select(4)
end, opts)
