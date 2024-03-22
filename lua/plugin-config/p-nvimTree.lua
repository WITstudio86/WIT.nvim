local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("没有找到 nvim-tree")
	return
end

-- 列表操作快捷键
nvim_tree.setup({
	-- 不显示 git 状态图标
	git = {
		enable = true,
	},
	-- project plugin 需要这样设置
	-- 支持切换目录
	update_cwd = true,
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	-- 隐藏 .文件 和 node_modules 文件夹
	filters = {
		dotfiles = true,
		custom = { "node_modules" },
	},
	view = {
		-- 宽度
		width = 40,
		-- 也可以 'right'
		side = "left",
		number = false,
		relativenumber = false,
		-- 显示图标
		signcolumn = "yes",
	},
	actions = {
		open_file = {
			-- 首次打开大小适配
			resize_window = true,
			-- 打开文件时关闭
			quit_on_open = true,
		},
	},
	-- wsl install -g wsl-open
	-- https://github.com/4U6U57/wsl-open/
	system_open = {
		-- cmd = "wsl-open", -- windows
		cmd = "open", -- mac
	},
	-- 快捷键绑定
})

-- 自动关闭
-- 会导致无法从终端直接通过 nvim 打开目录
-- vim.cmd([[
--   autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- ]])
