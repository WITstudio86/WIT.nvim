--  "将空格设置为 leader 键"
-- "查看 `:help mapleader`"
-- "注意：必须在插件加载之前发生（否则会使用错误的 leader）"
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 如果你安装了 Nerd 字体，设为 true
vim.g.have_nerd_font = true

-- "【设置选项】"
-- "查看 `:help vim.opt`"
-- "注意：你可以根据自己的愿望更改这些选项！"
-- "更多选项，你可以查看 `:help option-list`"

-- 默认显示行号
vim.opt.number = true
-- 相对行号，以帮助跳跃
vim.opt.relativenumber = true

-- 启用鼠标模式，例如在调整分割窗口时可能很有用！
vim.opt.mouse = "a"

-- 不显示模式，因为它已经在状态栏中了
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.opt.showmode = false

-- "同步操作系统和 Neovim 之间的剪贴板。"
-- "如果你想让你的操作系统剪贴板保持独立，请移除这个选项。"
-- "查看 `:help 'clipboard'`"
vim.opt.clipboard = "unnamedplus"

-- 启用断行缩进
vim.opt.breakindent = true

-- 保存撤销历史
vim.opt.undofile = true

-- 除非搜索项中有一个或多个大写字母，否则进行不区分大小写的搜索
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 默认情况下保持 signcolumn 开启
vim.opt.signcolumn = "yes"

-- 减少更新时间
vim.opt.updatetime = 250

-- 减少映射序列等待时间
-- 更快显示 which-key 弹出窗口
vim.opt.timeoutlen = 300

-- 配置新分割窗口应该如何打开
vim.opt.splitright = true
vim.opt.splitbelow = true

-- "设置 neovim 将如何在编辑器中显示某些空白字符。"
-- "查看 `:help 'list'`"
-- "以及 `:help 'listchars'`"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- "实时预览替换，边输入边预览！"!
vim.opt.inccommand = "split"

-- 显示光标所在的行
vim.opt.cursorline = true

-- 在光标上方和下方保持的最小屏幕行数。.
vim.opt.scrolloff = 10

-- 设置搜索时高亮，但在普通模式下按下 <Esc> 时清除
vim.opt.hlsearch = true

-- 永远显示 tabline
vim.o.showtabline = 2

-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "80"

-- 缩进2个空格等于一个Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true

-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2

-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true

-- 禁止折行
vim.wo.wrap = false

-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = "<,>,[,]"

-- 允许隐藏被修改过的buffer
-- 表示允许隐藏被修改过的 buffer。
-- 否则会报 E37: No write since last change 错误，强制你保存当前buffer后才允许切换到其他的 buffer。
vim.o.hidden = true

-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- 自动补全不自动选中
-- vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- 补全增强
vim.o.wildmenu = true

-- 补全最多显示10行
vim.o.pumheight = 10

-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
