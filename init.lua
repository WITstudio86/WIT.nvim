-- 基本设置
require("basic")
-- 插件管理
require("plugins")
-- 按键映射
require("mappings")
require("yankHightLight")
-- 主题样式
require("colorscheme")
-- 插件配置
require("plugin-config.p-comment")
require("plugin-config.p-gitsigns")
require("plugin-config.p-whichKey")
require("plugin-config.p-telescope")
require("plugin-config.p-conform")
require("plugin-config.p-cmp")
require("plugin-config.p-mini")
require("plugin-config.p-treesitter")
require("plugin-config.p-nvimTree")
require("plugin-config.p-bufferLine")
require("plugin-config.p-project")
require("plugin-config.p-codecunner")
require("plugin-config.p-tabnine")
-- p-dashboard在 plugins 中引用
-- require("plugin-config.p-dashboard")
require("lsp.setup")
