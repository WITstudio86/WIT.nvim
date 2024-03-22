local status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("没有找到 nvim-lspconfig 插件")
	return
end
-- LSP 是语言服务器协议的缩写，它是一种帮助编辑器和语言工具以标准化方式通信的协议。

-- LSP 提供了如下功能：
--  - 跳转到定义
--  - 查找引用
--  - 自动补全
--  - 符号搜索
--  - 更多！

-- LSP 服务器是独立的进程，它们与客户端（在这个例子中是 Neovim）通信。

-- 这个函数在 LSP 附加到特定缓冲区时运行。每次打开与 LSP 关联的新文件时
-- （例如，打开 `main.rs` 与 `rust_analyzer` 关联），
-- 这个函数将被执行以配置当前缓冲区。
local keymapFn = require("mappings").lspconfig
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		keymapFn(event)
	end,
})

-- LSP servers and clients are able to communicate to each other what features they support.
--  By default, Neovim doesn't support everything that is in the LSP specification.
--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
--  扩展 Neovim 的能力，以便更好地与 LSP 服务器通信
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

-- 启用以下语言服务器
-- 随意在此处添加/删除所需的任何 LSP。它们将自动安装。
-- 在下表中添加任何其他替代配置。可用的键有：
-- -- - cmp（表）：覆盖用于启动服务器的默认命令
-- -- - filetypes（表）：覆盖服务器关联文件类型的默认列表
-- -- - capabilities（表）：覆盖功能中的字段。可用于禁用某些 LSP 功能。-
-- -- - settings（表）：覆盖初始化服务器时传递的默认设置。
-- -- 例如，要查看“lua_ls”的选项，您可以转到： https:/luals.github.io/wiki/settings/
local servers = {
	clangd = {},
	-- gopls = {},
	pyright = {},
	rust_analyzer = {
        
    },
	-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
	--
	-- Some languages (like typescript) have entire language plugins that can be useful:
	--    https://github.com/pmizio/typescript-tools.nvim
	--
	-- But for many setups, the LSP (`tsserver`) will work just fine
	-- tsserver = {},
	--

	lua_ls = {
		-- cmd = {...},
		-- filetypes = { ...},
		-- capabilities = {},
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
				-- diagnostics = { disable = { 'missing-fields' } },
			},
		},
	},
}

-- 确保安装了上述服务器和工具
--  检查已安装工具的当前状态和/或手动安装
--  也可以执行指令
--    :Mason
--
--  You can press `g?` for help in this menu.
require("mason").setup()

-- 您可以在此处添加其他您希望 Mason 安装的工具
-- 以便它们可以从 Neovim 内部获得
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
    "codelldb",
	"stylua", -- 格式化 lua  代码
	"black",
	"clang-format",
	"lua-language-server",
})
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			-- 这仅处理覆盖上面的服务器配置显式传递的值。
			-- 禁用时很有用 --
			-- LSP 的某些功能（例如，关闭 tsserver 的格式设置）
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			require("lspconfig")[server_name].setup(server)
		end,
	},
})
