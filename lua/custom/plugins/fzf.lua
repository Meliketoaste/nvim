return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = {
    "nvim-tree/nvim-web-devicons",

    "ibhagwan/fzf-lua", -- optional
  },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup {

      vim.keymap.set("n", "<leader>fl", require("fzf-lua").builtin, { desc = "Fzf Files" }),
      vim.keymap.set({ "n", "v", "i" }, "<C-x><C-f>", function()
        require("fzf-lua").complete_path()
      end, { silent = true, desc = "Fuzzy complete path" }),
    }
  end,
}
