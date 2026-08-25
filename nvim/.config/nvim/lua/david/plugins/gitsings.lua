return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "-" },
      topdelete = { text = "^" },
      changedelete = { text = "%" },
    },
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 300,
      virt_text_pos = "eol",
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map("n", "]h", gs.next_hunk, "Git: next hunk")
      map("n", "[h", gs.prev_hunk, "Git: prev hunk")
      map("n", "<leader>hs", gs.stage_hunk, "Git: stage hunk")
      map("n", "<leader>hr", gs.reset_hunk, "Git: reset hunk")
      map("n", "<leader>hp", gs.preview_hunk, "Git: preview hunk")
      map("n", "<leader>hb", gs.blame_line, "Git: blame line")
    end,
  },
}
