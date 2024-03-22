local status, which_key = pcall(require, "which-key")
if not status then
	vim.notify("没有找到 which-key 插件")
	return
end

which_key.setup()

-- Document existing key chains
-- 提示文字
which_key.register({
	["<leader>c"] = { name = "[C]ode :代码", _ = "which_key_ignore" },
	["<leader>d"] = { name = "[D]iagnostic :诊断", _ = "which_key_ignore" },
	["<leader>r"] = { name = "[R]un :运行", _ = "which_key_ignore" },
	["<leader>s"] = { name = "[S]earch :查找", _ = "which_key_ignore" },
	["<leader>w"] = { name = "[W]indow :分屏,窗口", _ = "which_key_ignore" },
	["<leader>t"] = { name = "[T]erminal :终端", _ = "which_key_ignore" },
	["<leader>f"] = { name = "[F]eil :文件操作", _ = "which_key_ignore" },
	["<leader>l"] = { name = "[L]sp :语言服务", _ = "which_key_ignore" },
	["<leader>lg"] = { name = "[G]oto :跳转", _ = "which_key_ignore" },
	["<leader>lc"] = { name = "[C]ode :代码", _ = "which_key_ignore" },
	["<leader>lr"] = { name = "[R]eset :重置", _ = "which_key_ignore" },
	["<leader>e"] = { name = "[E] : 打开文件树", _ = "which_key_ignore" },
	["<leader>b"] = { name = "[B]uffer : buffer操作", _ = "which_key_ignore" },
	["<leader>m"] = { name = "[M]arkdown : markdown相关操作", _ = "which_key_ignore" },
})
