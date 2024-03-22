-- NOTE: 更好的选中
-- Examples:
--  - va)  -选中)及内包裹内容
--  - vi)  -选中)及内包裹内容
require("mini.ai").setup({ n_lines = 500 })

-- NOTE: 更好的删除替换周围符号			--
-- - sa" -选中区域周围添加" [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - 删除光标附近的' [S]urround [D]elete [']quotes
-- - sr)'  - 替换光标最近的)为' [S]urround [R]eplace [)] [']
require("mini.surround").setup()

-- NOTE: 鼠标移动动画
require("mini.animate").setup()

-- NOTE: 缩进线提示
require("mini.indentscope").setup({})

-- NOTE: 底部状态栏
local statusline = require("mini.statusline")
-- set use_icons to true if you have a Nerd Font
statusline.setup({ use_icons = vim.g.have_nerd_font })
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
	return "%2l:%-2v"
end

-- ... and there is more!
--  Check out: https://github.com/echasnovski/mini.nvim
