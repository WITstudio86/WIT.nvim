local status, runner = pcall(require, "code_runner")
if not status then
	vim.notify("没有找到 code-runner 插件")
	return
end

runner.setup({
	mode = "float",
	float = {
		border = "double",
	},
	filetype = {
		python = "python3 -u",
		rust = {
			"cd $dir &&",
			"cargo run",
		},
	},
})
