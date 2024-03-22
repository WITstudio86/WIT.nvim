local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("没有找到 bufferline")
	return
end

-- bufferline 配置
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
	options = {
		show_buffer_icons = true, -- 显示 buffer 图标
		show_tab_indicators = true, -- 显示 tab 指示器
		show_close_icon = true, -- 显示关闭图标
		-- 你可以自定义 bufferline 的样式
		style = "unique", -- "unique", "minimal", "alpha", "diagonal"
		separator_style = "slant", -- "slant", "straight", "round", "square"
		close_command = "bdelete", -- 关闭 buffer 的命令
		mappings = true, -- 启用默认的快捷键映射
		max_name_length = 14, -- 最大 buffer 名称长度
		max_preview_length = 40, -- 最大预览长度
		tab_size = 18, -- tab 大小
		-- 侧边栏配置
		-- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
		-- 使用 nvim 内置 LSP  后续课程会配置
		diagnostics = "nvim_lsp",
		-- 可选，显示 LSP 报错图标
		---@diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
	},
})
