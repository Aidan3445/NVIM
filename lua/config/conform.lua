local CONFORM = {}

function CONFORM.setup()
	local conform = require("conform")

	conform.setup({
		formatters_by_ft = {
			swift = { "swiftformat" },
		},
		format_on_save = function(bufnr)
			local ignore_filetypes = { "swift" }
			if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
				return { timeout_ms = 500, lsp_fallback = true }
			end
		end,
		log_level = vim.log.levels.ERROR,
	})

	-- Format and save on <leader>S
	vim.keymap.set("n", "<leader>S", function()
		conform.format({ async = true, lsp_fallback = true })
		vim.cmd("w")
		print("formatted")
	end, {
		desc = "Conform: format and save",
	})
end

return CONFORM
