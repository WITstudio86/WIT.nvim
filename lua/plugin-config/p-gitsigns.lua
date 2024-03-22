local status, gitsigns = pcall(require, "gitsigns")
if not status then
	vim.notify("没有找到 gitsigns 插件")
	return
end

gitsigns.setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
	-- 可以通过 `:Gitsigns toggle_signs` 命令来切换符号栏的显示
	signcolumn = true,
	-- 可以通过 `:Gitsigns toggle_numhl` 命令来切换行号高亮
	numhl = false,
	-- 可以通过 `:Gitsigns toggle_linehl` 命令来切换行高亮
	linehl = false,
	-- 可以通过 `:Gitsigns toggle_word_diff` 命令来切换单词级别
	-- 的差异显示
	word_diff = false,
	watch_gitdir = {
		follow_files = true, -- 监视文件变化
	},
	auto_attach = true, -- 自动附加到打开的文件
	attach_to_untracked = false, -- 不自动附加到未跟踪的文件
	current_line_blame = false, -- 可以通过 `:Gitsigns toggle_current_line_blame` 命令来切换当前行的提交信息显示
	current_line_blame_opts = {
		virt_text = true, -- 显示虚拟文本
		virt_text_pos = "eol", -- 虚拟文本的位置选项，可以是 'eol'（行尾）、'overlay'（覆盖）或 'right_align'（右对齐）
		delay = 1000, -- 延迟时间（毫秒）
		ignore_whitespace = false, -- 是否忽略空白字符
		virt_text_priority = 100, -- 虚拟文本的优先级
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>", -- 当前行提交信息的格式化字符串
	sign_priority = 6, -- 符号的优先级
	update_debounce = 100, -- 更新延迟（反弹时间），用于节流更新操作
	status_formatter = nil, -- 使用默认的状态格式化函数
	max_file_length = 40000, -- 如果文件行数超过这个值，则禁用插件（默认为 40000 行）
	preview_config = {
		-- 传递给 `nvim_open_win` 的选项
		border = "single", -- 预览窗口的边框样式
		style = "minimal", -- 预览窗口的样式
		relative = "cursor", -- 预览窗口的相对位置
		row = 0, -- 预览窗口的行位置
		col = 1, -- 预览窗口的列位置
	},
	yadm = {
		enable = false, -- 是否启用 yadm 集成
	},
})
