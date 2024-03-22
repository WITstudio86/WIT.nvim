local status, conform = pcall(require, "conform")
if not status then
	vim.notify("没有找到 conform 插件")
	return
end
conform.setup({
	-- 格式化出现错误的时候不弹出提示
	notify_on_error = false,
	format_on_save = function(bufnr)
		-- 对于没有统一标准编码风格的编程语言，禁用 "format_on_save lsp_fallback"
		-- 你可以在这里添加额外的语言，或者为已禁用的语言重新启用它
		-- languages here or re-enable it for the disabled ones.
		local disable_filetypes = { c = true, cpp = true }
		return {
			-- -- 设置格式化操作的超时时间为 500 毫秒
			timeout_ms = 500,
			-- 根据文件类型决定是否使用 LSP 回退格式化
			lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		}
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		cpp = { "clang-format" },
		rust = { "rust_analyzer" },
		-- 为 Lua 语言设置 `stylua` 作为格式化工具
		-- Conform 也可以顺序运行多个格式化工具
		-- python = { "isort", "black" },
		--
		-- 你可以使用子列表来告诉 conform 运行 *直到* 找到格式化工具为止
		-- javascript = { { "prettierd", "prettier" } },	},
	},
})
