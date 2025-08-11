-- Expand or jump forward
vim.api.nvim_set_keymap(
	"i",
	"<C-s>",
	[[<cmd>lua require('luasnip').expand_or_jump()<CR>]],
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
	"s",
	"<C-k>",
	[[<cmd>lua require('luasnip').expand_or_jump()<CR>]],
	{ silent = true, noremap = true }
)

-- Jump backward
vim.api.nvim_set_keymap("i", "<C-h>", [[<cmd>lua require('luasnip').jump(-1)<CR>]], { silent = true, noremap = true })
vim.api.nvim_set_keymap("s", "<C-h>", [[<cmd>lua require('luasnip').jump(-1)<CR>]], { silent = true, noremap = true })

vim.keymap.set("n", "<tab>", function()
	require("telescope.builtin").live_grep({ cwd = vim.loop.cwd() })
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-m>", ":Telescope<CR>")
vim.keymap.set("n", "<leader>v", function()
	vim.cmd("vsplit")
	vim.cmd("wincmd =") -- This balances all window sizes evenly
end)
