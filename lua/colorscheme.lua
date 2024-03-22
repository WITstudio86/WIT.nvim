--  NOTE: 颜色主题
-- 如果主题存在就设置不存在就拦截错误返回没找到 , 不会导致编辑器崩溃
local colorscheme = "everforest"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
	return
end
