# goFinder-TUI (`gf`)

> 为了在 **Orca** 内部终端中使用，从 [goFinder](https://github.com/aoyamashou/goFinder) 的 GUI 版本派生出的纯终端 TUI 文件管理器，**快捷键与操作逻辑与 goFinder 保持一致**。

## 特点

- **与 goFinder 一致的键位**：保留方向键导航与单键操作习惯，从 GUI 切到终端零学习成本；也支持开启 Vim 键位（`h/j/k/l`）。
- **Yazi 式三栏布局**：上级目录｜当前目录｜实时预览并排显示，移动光标即刻预览文本、图片与目录内容。
- **极速过滤与拼音首字母搜索**：按 `f` 边打字边过滤，支持中文拼音首字母（如输入 `mxcx` 匹配 `模型查询.txt`）。
- **安全文件操作**：删除默认移到系统废纸篓，不直接永久删除。
- **纯 Go 无 cgo**：轻量、启动快、低资源占用，支持 macOS 与 Linux。

## 安装

### 一键安装脚本（推荐）

```bash
curl -fsSL https://raw.githubusercontent.com/aoyamashou/goFinder-TUI/main/install.sh | sh
```

脚本会自动识别系统（macOS / Linux）与架构（`arm64` / `amd64`），从 GitHub Releases 下载最新版本的 `gf` 并安装到 `/usr/local/bin` 或 `~/.local/bin`。

### 通过 Go 安装

```bash
go install github.com/aoyamashou/goFinder-TUI/cmd/gf@latest
```

## 键位

| 功能 | 快捷键 |
| --- | --- |
| 移动 / 进入 / 返回上级 | `↑↓` / `→` / `←` |
| 跳到顶部 / 底部 | `Home` / `End` |
| 后退 / 前进 | `Alt+←` / `Alt+→` |
| 过滤（支持拼音首字母） | `f` |
| 选中 / 全选 / 取消选择 | `Space` / `Ctrl+A` / `Esc` |
| 复制 / 复制路径 / 剪切 / 粘贴 | `c` / `c c` / `x` / `v` |
| 重命名 | `Enter` |
| 新建文件夹 / 新建文件 | `n` / `n n` |
| 移到废纸篓 | `d` |
| 在编辑器中打开 / 系统默认打开 | `e` / `o` |
| 显示隐藏文件 / 排序方式 / 刷新 | `.` / `,` / `Ctrl+R` |
| 前往路径 / 回到起点 / 主目录 | `g` / `` ` `` / `Alt+H` |
| 预览向上 / 向下滚动 | `PageUp` (`Ctrl+U`) / `PageDown` (`Ctrl+D`) |
| 速查表 | `?` |
| 退出 / 退出（不切换目录） | `q` / `Shift+Q` |

- `c c`、`n n` 为同键双击。
- 支持通过 `keymap.json` 按动作 ID 覆盖默认快捷键（动作 ID 见 [tui/actions.go](tui/actions.go)）。
