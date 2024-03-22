local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("没有找到 nvim-treesitter 插件")
	return
end

treesitter.setup({
	ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc", "rust", "cpp", "python" },
	-- 自动安装未安装的语言
	auto_install = true,
	highlight = {
		enable = true,
		-- 某些语言依赖于 vim 的正则表达式高亮系统（如 Ruby）来执行缩进规则。
		-- WARN: 如果您遇到奇怪的缩进问题，请将该语言添加到
		-- 缩进的additional_vim_regex_highlighting和禁用语言列表中。
		additional_vim_regex_highlighting = { "ruby" },
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			-- 增量选择 , 不断扩大选中区域
			init_selection = "<CR>",
			node_incremental = "<CR>",
			--  减量选择 , 不断缩小选中区域
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	-- 启用缩进(=)但是禁用 ruby的缩进
	indent = { enable = true, disable = { "ruby" } },
})
-- 开启 Folding 模块
-- zc 折叠
-- zo 打开
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
