local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("没有找到 telescope 插件")
	return
end
-- NOTE: 快捷键映射
require("mappings").telescope()
-- NOTE: 配置
telescope.setup({
	--
	-- defaults = {
	--   mappings = {
	--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
	--   },
	-- },
	-- pickers = {}
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})

-- Enable Telescope extensions if they are installed
-- NOTE: 检测依赖缺失并反馈
local statusFzf, _ = pcall(require("telescope").load_extension, "fzf")
if not statusFzf then
	vim.notify("telescope 插件缺失依赖 fzf")
	return
end
local statusUiSelect, _ = pcall(require("telescope").load_extension, "ui-select")
if not statusUiSelect then
	vim.notify("telescope 插件缺失依赖 statusFzf")
	return
end
