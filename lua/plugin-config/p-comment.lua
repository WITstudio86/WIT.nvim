--  配置
return {
	---在注释和代码行之间添加空格
	padding = true,
	---是否保持光标在其位置
	sticky = true,
	---在（取消）注释时忽略的行
	-- ignore = nil,
	---在普通模式下切换注释的映射的左手边（LHS）
	toggler = {
		---行注释切换键图
		line = "gcc",
		---块注释切换键图
		block = "gbc",
	},
	---在普通和可视模式下操作符等待模式的映射的左手边（LHS）
	opleader = {
		---行注释键图
		line = "gc",
		---块注释键图
		block = "gb",
	},
	---额外映射的左手边（LHS）
	extra = {
		---在上方的行添加注释
		above = "gcO",
		---在下方的行添加注释
		below = "gco",
		---在行尾添加注释
		eol = "gcA",
	},
	---启用键绑定
	---注意：如果设置为 `false` 那么插件不会创建任何映射
	mappings = {
		---操作符等待映射；`gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
		basic = true,
		---额外映射；`gco`, `gcO`, `gcA`
		extra = true,
	},
	---在（取消）注释之前调用的函数
	-- pre_hook = nil,
	---在（取消）注释之后调用的函数
	-- post_hook = nil,
}
