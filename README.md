# WIT.nvim

> 一个基于 kickstart 的 nvim 配置

- 中文注释
- 基于 kickstart
- 绝大多数快捷键绑定在<Space> 上 , 配合 which-key几乎可以看到所有快捷键提示
- 快捷键中文提示,且在一个配置文件中
- lazy.vim管理插件

## 功能列表
- 语言服务
- 代码高亮
- AI 代码补全
- coderunner 代码快速执行
- 模糊查找工具
- markdown 预览和图片快速插入工具

## install

### MAC / Linux

```bash
git clone https://github.com/WITstudio86/WIT.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

### Window

```bash
git clone https://github.com/WITstudio86/WIT.nvim.git $env:USERPROFILE\AppData\Local\nvim\
```

## 目录结构

```
.
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── basic.lua  基本配置文件
    ├── lsp  lsp配置存放的文件夹
    ├── mappings.lua  按键映射文件
    ├── plugin-config  插件配置的文件夹
    ├── plugins.lua  插件管理文件
    └── yankHightLight.lua  基本配置(赋值复制 高亮)
```
