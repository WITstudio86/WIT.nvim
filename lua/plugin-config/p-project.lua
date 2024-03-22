local status, project = pcall(require, "project_nvim")
if not status then
	vim.notify("没有找到 project_nvim")
	return
end

-- nvim-tree 支持
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
	detection_methods = { "lsp", "pattern" },

	-- 当 **"pattern"** 在 detection_methods 中时，用于检测根目录的所有模式
	patterns = {
		".git",
		"_darcs",
		".hg",
		".bzr",
		".svn",
		"Makefile",
		"package.json",
		".sln",
		"Cargo.toml",
	},

	-- 通过名称忽略的 LSP 客户端表
	-- 例如：{ "efm", ... }
	ignore_lsp = {},

	-- 在特定目录上不要计算根目录
	-- 例如：{ "~/.cargo/*", ... }
	exclude_dirs = {},

	-- 在 telescope 中显示隐藏文件
	show_hidden = false,

	-- 如果设置为 false，当 project.nvim 改变你的目录时，你将收到一条消息。
	silent_chdir = false,

	-- 更改目录的 scope，有效选项有
	-- * global（默认）
	-- * tab
	-- * win
	scope_chdir = "global",

	-- project.nvim 将存储项目历史的地方，用于在 telescope 中使用
	datapath = vim.fn.stdpath("data"),
})

local statust, telescope = pcall(require, "telescope")
if not statust then
	vim.notify("没有找到 telescope")
	return
end
local statustb, _ = pcall(telescope.load_extension, "projects")
if not statustb then
	vim.notify("没有正确添加指令")
end
