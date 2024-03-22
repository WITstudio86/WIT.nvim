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
		"sainnhe/everforest",
		config = function()
			vim.cmd("colorscheme everforest")
		end,
	},

	-- "gc" to comment visual regions/lines
	-- NOTE: 快捷注释 , gcc gbc 等
	{ "numToStr/Comment.nvim", opts = require("plugin-config.p-comment") },

	-- Adds git related signs to the gutter, as well as utilities for managing changes
	-- NOTE: 装订线中的 git 提示
	{ "lewis6991/gitsigns.nvim" },

	-- Useful plugin to show you pending keybinds.
	-- Sets the loading event to 'VimEnter'
	-- 在 vim 被打开的时候就加载
	-- NOTE: 快捷键查看提示
	{ "folke/which-key.nvim", event = "VimEnter" },

	-- NOTE: 文件快捷搜索工具
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
	},
	-- LSP Configuration & Plugins
	-- NOTE: lsp 配置
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- 自动安装 LSP 和相关工具到 Neovim 的标准路径
			-- Mason 是一个工具管理器，用于安装和管理 LSP 服务器
			"williamboman/mason.nvim",
			-- Mason 的 LSP 配置插件
			"williamboman/mason-lspconfig.nvim",
			-- Mason 工具安装器，用于安装 LSP 服务器
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- 提供 LSP 状态更新的实用工具.
			-- -- Fidget.nvim 提供 LSP 状态的实时更新
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- neodev 配置 Lua LSP
			-- 用于 Neovim 配置、运行时和插件的完成、注释和签名
			{ "folke/neodev.nvim", opts = {} },
		},
	},

	-- NOTE: 自动格式化
	{ "stevearc/conform.nvim" },

	-- NOTE: 自动完成
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet 引擎及其关联的 nvim-cmp 源
			{
				"L3MON4D3/LuaSnip",
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
			"saadparwaiz1/cmp_luasnip",

			-- 添加其他补全功能.
			--  默认情况下，NVIM-CMP 不会随所有源一起提供。
			--  它们被拆分为多个存储库，用于维护目的。.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
	},

	-- Highlight todo, notes, etc in comments
	-- NOTE: 高亮的特殊注释
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	-- NOTE: 小型插件的集合
	{ "echasnovski/mini.nvim" },

	-- NOTE: 代码高亮
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- NOTE: 左侧文件树
	{ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" },

	-- NOTE: buffer 在顶部标签的形式出现
	{
		"akinsho/bufferline.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	},

	-- NOTE: 启动页面
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("plugin-config.p-dashboard")
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	-- NOTE: 配合 telescope 搜索项目
	{ "ahmedkhalf/project.nvim" },
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
