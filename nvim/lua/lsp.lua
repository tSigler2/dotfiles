require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"go",
		"gomod",
		"python",
		"javascript",
		"lua",
		"rust",
		"c",
		"cpp",
		"typescript",
		"erlang",
		"java",
		"ruby",
		"zig",
		"haskell",
		"fortran",
		"bash",
		"cmake",
		"make",
	},
	highlight = {
		enable = true,
	},
})

require("lspconfig").gopls.setup({
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})

require("lspconfig").pylsp.setup({
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
	callback = function()
		vim.cmd("silent! !clang-format -i %")
	end,
})

local mason_registry = require("mason-registry")
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "omnisharp" },
})
