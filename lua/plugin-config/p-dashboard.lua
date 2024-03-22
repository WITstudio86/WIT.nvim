local status, db = pcall(require, "dashboard")
if not status then
	vim.notify("没有找到 dashboard")
	return
end

db.setup({
	theme = "doom", -- 选择 hyper/doom 主题
	disable_move = true, -- 禁用默认的移动键位映射
	shortcut_type = "letter", -- 使用数字/字母作为快捷方式类型
	change_to_vcs_root = false, -- 在打开最近使用文件时，切换到 vcs 的根目录
	config = {
		header = {
			"",
			"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ",
			"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
			"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ",
			"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
			"          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
			"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
			"    ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
			"   ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
			"   ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ",
			"  █     █░ ██▓▄▄▄█████▓",
			" ▓█░ █ ░█░▓██▒▓  ██▒ ▓▒",
			" ▒█░ █ ░█ ▒██▒▒ ▓██░ ▒░",
			" ░█░ █ ░█ ░██░░ ▓██▓ ░ ",
			" ░░██▒██▓ ░██░  ▒██▒ ░ ",
			" ░ ▓░▒ ▒  ░▓    ▒ ░░   ",
			"   ▒ ░ ░   ▒ ░    ░    ",
			"   ░   ░   ▒ ░  ░      ",
			"     ░     ░           ",
		}, --your header
		center = {
			{
				icon = "  ",
				icon_hl = "Title",
				desc = "Projects :打开项目",
				desc_hl = "String",
				key = "p",
				keymap = "SPC s p",
				key_hl = "Number",
				key_format = " %s", -- remove default surrounding `[]`
				action = "Telescope projects",
			},
			{
				icon = "  ",
				icon_hl = "Title",
				desc = "Recently Files :最近修改",
				desc_hl = "String",
				key = "o",
				keymap = "SPC s o",
				key_hl = "Number",
				key_format = " %s", -- remove default surrounding `[]`
				action = "Telescope oldfiles",
			},
			{
				icon = "  ",
				icon_hl = "Title",
				desc = "Edit config :搜索文件",
				desc_hl = "String",
				key = "f",
				keymap = "SPC s f",
				key_hl = "Number",
				key_format = " %s", -- remove default surrounding `[]`
				action = "Telescope find_files",
			},
			{
				icon = "  ",
				icon_hl = "Title",
				desc = "Edit config :修改配置",
				desc_hl = "String",
				key = "c",
				key_hl = "Number",
				key_format = " %s", -- remove default surrounding `[]`
				action = "edit ~/.config/nvim/init.lua",
			},
		},
		footer = {
			" WIT : 加油ヾ(◍°∇°◍)ﾉﾞ",
		}, --your footer
	},
	hide = {
		statusline = false, -- 不隐藏状态栏
		tabline = true, -- 隐藏标签栏
		winbar = false, -- 不隐藏窗口栏
	},
})
