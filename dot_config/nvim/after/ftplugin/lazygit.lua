-- Ensures that Esc behaves as expected.
vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "<Esc>", { noremap = true, silent = true })
