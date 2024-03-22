--  "将空格设置为 leader 键"
-- "查看 `:help mapleader`"
-- "注意：必须在插件加载之前发生（否则会使用错误的 leader）"
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
-- 复用 opt 参数
-- local opt = { noremap = true, silent = true }

-- jk 代替 esc
map("i", "jk", "<ESC>", { desc = "返回 Normal模式" })

-- esc 的时候取消搜索高亮
map("n", "<ESC>", "<cmd>nohlsearch<CR>")

-- NOTE: 代码折叠操作
map("n", "<leader>cc", "zc", { desc = "[ZC] :折叠代码块" })
map("n", "<leader>co", "zo", { desc = "[ZO] :展开代码块" })

-- NOTE: 诊断映射
map("n", "[d", vim.diagnostic.goto_prev, { desc = "[D]iagnostic 跳转到上一个诊断" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "[D]iagnostic 跳转到下一个诊断" })
map("n", "<leader>de", vim.diagnostic.open_float, { desc = "[D]iagnostic[E]rror :显示诊断错误信息" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "[D]iagnostic[L]ist :显示诊断列表" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- >>>>> 终端操作
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "退出 terminal" })
map("n", "<leader>th", ":sp | terminal<CR>", { desc = "[T]erminl: 水平分屏打开终端" })
map("n", "<leader>tv", ":vsp | terminal<CR>", { desc = "[T]erminl: 垂直分屏打开终端" })
map("n", "<leader>tt", ":terminal<CR>", { desc = "[T]erminl: 打开内置终端" })

-- TIP: Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map("n", "<C-h>", "<C-w><C-h>", { desc = "[W]indow : 移动到左侧窗口" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "[W]indow : 移动到右侧窗口" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "[W]indow : 移动到下侧窗口" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "[W]indow : 移动到上侧窗口" })

-- NOTE: 分屏和窗口
--
-- 取消 s 默认功能
map("n", "s", "")
-- windows 分屏快捷键
map("n", "<leader>wv", ":vsp<CR>", { desc = "[W]indow : 垂直分屏" })
map("n", "<leader>wh", ":sp<CR>", { desc = "[W]indow : 水平分屏" })
map("n", "<leader>wc", "<C-w>c", { desc = "[W]indow : 关闭当前分屏" })
map("n", "<leader>wo", "<C-w>o", { desc = "[W]indow : 关闭其他分屏" })
-- 左右比例控制
map("n", "<leader>w,", ":vertical resize -20<CR>", { desc = "[W]indow : 减小水平分屏尺寸" })
map("n", "<leader>w.", ":vertical resize +20<CR>", { desc = "[W]indow : 增大水平分屏尺寸" })
map("n", "<leader>wj", ":resize -20<CR>", { desc = "[W]indow : 减小垂直分屏尺寸" })
map("n", "<leader>wk", ":resize +20<CR>", { desc = "[W]indow : 增大垂直分屏尺寸" })
-- 等比例
map("n", "<leader>w=", "<C-w>=", { desc = "[W]indow: 等比例窗口尺寸" })

--NOTE: 可视模式
--
-- 快速移动行
map("v", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "快速向下移动行" })
map("v", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "快速向上移动行" })

--NOTE: 文件 操作
--
map("n", "<leader>fq", ":x<CR>", { desc = "[F]ile :保存并退出" })
map("n", "<leader>fw", ":w<CR>", { desc = "[F]ile :写入文件" })

-- NOTE: buffer操作快捷键
-- bufferline
-- 左右Tab切换
map("n", "<leader>b[", ":BufferLineCyclePrev<CR>", { desc = "[←] :上一个 buffer" })
map("n", "<leader>b]", ":BufferLineCycleNext<CR>", { desc = "[→] :下一个 buffer" })
-- 关闭
--"moll/vim-bbye"
map("n", "<leader>bx", ":bdelete<CR>", { desc = "[C]lose: 关闭当前 buffer" })

-- NOTE: 插件快捷键映射
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "[E] :打开/关闭文件树" })
map("n", "<leader>mv", ":MarkdownPreview<CR>", { desc = "pre[V]iew : 打开 meekdown 预览" })
local pluginKeys = {}
-- NOTE: telescope 模糊检索工具
pluginKeys.telescope = function()
	-- 查看 `:help telescope.builtin` 获取更多内置函数的信息
	local builtin = require("telescope.builtin") -- 引入 telescope.builtin 模块

	-- 在普通模式下，使用 <leader>sh 快捷键来调用内置的帮助标签查找函数
	vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[H]elp :搜索帮助信息" })

	-- 在普通模式下，使用 <leader>sk 快捷键来调用内置的键位映射查找函数
	vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[K]eymaps :搜索快捷键" })

	-- 在普通模式下，使用 <leader>sf 快捷键来调用内置的文件查找函数
	vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[F]iles :搜索文件" })

	-- 在普通模式下，使用 <leader>st 快捷键来调用内置的 Telescope 选择函数
	vim.keymap.set("n", "<leader>st", builtin.builtin, { desc = "[T]elescope :搜索telescope指令" })

	-- 在普通模式下，使用 <leader>sw 快捷键来调用内置的字符串查找函数
	vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[W]ord :查找字符串" })

	-- 在普通模式下，使用 <leader>sg 快捷键来调用内置的实时 grep 函数"
	vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[G]rep :动态搜索文本内容" })

	-- 在普通模式下，使用 <leader>sd 快捷键来调用内置的诊断查找函数
	vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[D]iagnostics :查找诊断信息" })

	-- 在普通模式下，使用 <leader>sr 快捷键来调用内置的搜索恢复函数"
	vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[R]esume :回复最近一次搜索历史" })

	-- 在普通模式下，使用 <leader>s. 快捷键来调用内置的最近文件查找函数
	vim.keymap.set("n", "<leader>so", builtin.oldfiles, { desc = "[O]ld :搜索最近打开过的文件" })

	-- 在普通模式下，使用 <leader>sb 快捷键来调用内置的缓冲区查找函数
	vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[B]uffer :快速搜索缓冲区" })

	-- 在普通模式下，使用 <leader><leader> 快捷键来调用内置的缓冲区查找函数
	vim.keymap.set("n", "<leader>sp", "<CMD>Telescope projects<CR>", { desc = "[P]rojects :搜索打开过的项目" })
end

-- NOTE:  lsp相关
pluginKeys.lspconfig = function(event)
	-- 便于快捷键绑定的复用函数
	local lspMap = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end

	-- 跳转到定义
	-- ctrl t 可以跳转回去
	lspMap("<leader>lgd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition :跳转到定义")

	-- 跳转到引用
	lspMap("<leader>lgr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences :跳转到引用")

	-- 跳转到类型实现处
	lspMap("<leader>lgi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation :跳转到实现")

	-- 跳转到类型定义处
	lspMap(
		"<leader>lgD",
		require("telescope.builtin").lsp_type_definitions,
		"Type [D]efinition :跳转到类型定义处"
	)

	-- 搜索当前文件中的所有符号
	lspMap(
		"<leader>ss",
		require("telescope.builtin").lsp_document_symbols,
		"[D]ocument [S]ymbols :当前文件的所有符号"
	)

	-- 检索当前工作空间中的符号
	lspMap(
		"<leader>sws",
		require("telescope.builtin").lsp_dynamic_workspace_symbols,
		"[W]orkspace [S]ymbols :搜索当前工作空间的所有符号"
	)

	-- 重命名
	lspMap("<leader>lrn", vim.lsp.buf.rename, "[R]e[n]ame :重命名")

	-- 自动代码操作
	lspMap("<leader>lca", vim.lsp.buf.code_action, "[C]ode [A]ction :自动代码操作")

	-- 查看悬停文档
	lspMap("<leader>lh", vim.lsp.buf.hover, "[H]over Documentation :查看悬停文档")

	-- WARN: This is not Goto Definition, this is Goto Declaration.
	--  For example, in C this would take you to the header.
	-- 跳转到声明处 , 例如头文件
	lspMap("<leader>lgD", vim.lsp.buf.declaration, "[G]oto [D]eclaration :跳转到声明(如头文件)")

	-- The following two autocommands are used to highlight references of the
	-- word under your cursor when your cursor rests there for a little while.
	--    See `:help CursorHold` for information about when this is executed
	--
	-- 确保当前 LSP 支持文档高亮功能，然后创建相应的 autocmd 以在悬停时高亮引用
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if client and client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = event.buf,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

-- NOTE: 文件树列表快捷键
pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit", desc = "垂直分屏打开文件" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	-- 刷新文件树的显示
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	-- 使用系统默认软件打开文件
	{ key = "s", action = "system_open" },
}

--NOTE: markdown 粘贴图片
pluginKeys.imgClip = {
	{ "<leader>mp", "<cmd>PasteImage<cr>", desc = "[P]aste :粘贴图片到 markdown " },
}
return pluginKeys
