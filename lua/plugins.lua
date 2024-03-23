-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
require("lazy").setup({
	-- NOTE: 主题样式
	{
		"WITstudio86/everforest",
		config = function()
			vim.cmd("colorscheme everforest")
		end,
	},

	-- "gc" to comment visual regions/lines
	-- NOTE: 快捷注释 , gcc gbc 等
	{ "WITstudio86/Comment.nvim", opts = require("plugin-config.p-comment") },

	-- Adds git related signs to the gutter, as well as utilities for managing changes
	-- NOTE: 装订线中的 git 提示
	{ "WITstudio86/gitsigns.nvim" },

	-- Useful plugin to show you pending keybinds.
	-- Sets the loading event to 'VimEnter'
	-- 在 vim 被打开的时候就加载
	-- NOTE: 快捷键查看提示
	{ "WITstudio86/which-key.nvim", event = "VimEnter" },

	-- NOTE: 文件快捷搜索工具
	{
		"WITstudio86/telescope.nvim",
		event = "VimEnter",
		-- branch = "0.1.x",
		dependencies = {
			"WITstudio86/plenary.nvim",
			{
				"WITstudio86/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "WITstudio86/telescope-ui-select.nvim" },
			{ "WITstudio86/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
	},
	-- LSP Configuration & Plugins
	-- NOTE: lsp 配置
	{
		"WITstudio86/nvim-lspconfig",
		dependencies = {
			-- 自动安装 LSP 和相关工具到 Neovim 的标准路径
			-- Mason 是一个工具管理器，用于安装和管理 LSP 服务器
			"WITstudio86/mason.nvim",
			-- Mason 的 LSP 配置插件
			"WITstudio86/mason-lspconfig.nvim",
			-- Mason 工具安装器，用于安装 LSP 服务器
			"WITstudio86/mason-tool-installer.nvim",

			-- 提供 LSP 状态更新的实用工具.
			-- -- Fidget.nvim 提供 LSP 状态的实时更新
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "WITstudio86/fidget.nvim", opts = {} },

			-- neodev 配置 Lua LSP
			-- 用于 Neovim 配置、运行时和插件的完成、注释和签名
			{ "WITstudio86/neodev.nvim", opts = {} },
		},
	},

	-- NOTE: 自动格式化
	{ "WITstudio86/conform.nvim" },

	-- NOTE: 自动完成
	{
		"WITstudio86/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet 引擎及其关联的 nvim-cmp 源
			{
				"WITstudio86/LuaSnip",
				build = (function()
					-- 代码段中的正则表达式支持需要构建步骤.
					-- WARN: 许多 Windows 环境不支持此步骤.
					-- 除以下条件以在 Windows 上重新启用.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `'friendly-snippets' 包含各种预制片段。.
					--   看有关个别语言/框架/插件片段的 README::
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
			},
			"WITstudio86/cmp_luasnip",

			-- 添加其他补全功能.
			--  默认情况下，NVIM-CMP 不会随所有源一起提供。
			--  它们被拆分为多个存储库，用于维护目的。.
			"WITstudio86/cmp-nvim-lsp",
			"WITstudio86/cmp-path",
		},
	},

	-- Highlight todo, notes, etc in comments
	-- NOTE: 高亮的特殊注释
	{
		"WITstudio86/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "WITstudio86/plenary.nvim" },
		opts = { signs = false },
	},

	-- NOTE: 小型插件的集合
	{ "WITstudio86/mini.nvim" },

	-- NOTE: 代码高亮
	{
		"WITstudio86/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- NOTE: 左侧文件树
	{ "WITstudio86/nvim-tree.lua", requires = "WITstudio86/nvim-web-devicons" },

	-- NOTE: buffer 在顶部标签的形式出现
	{
		"WITstudio86/bufferline.nvim",
		requires = { "WITstudio86/nvim-web-devicons" },
	},

	-- NOTE: 启动页面
	{
		"WITstudio86/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("plugin-config.p-dashboard")
		end,
		dependencies = { { "WITstudio86/nvim-web-devicons" } },
	},

	-- NOTE: 配合 telescope 搜索项目
	{ "WITstudio86/project.nvim" },

	--NOTE: markdown 预览
	{
		"WITstudio86/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- NOTE:  markdown粘贴图片
	{
		"WITstudio86/img-clip.nvim",
		event = "BufEnter",
		keys = require("mappings").imgClip,
	},

	-- NOTE: 代码运行
	{ "WITstudio86/code_runner.nvim", config = true },

	-- NOTE: 代码 AI
	{ "WITstudio86/tabnine-nvim", build = "./dl_binaries.sh" },
}, {
	-- 字体图标
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
