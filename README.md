# AIFUPAN 直播录屏工作台（便携版 v0.1.0）

一键把直播间 / 网页声音画面录制并保存到本地，自动转写、自动压缩，自带完整运行环境，**解压即用，无需安装 Python / ffmpeg**。

## 一、最快上手（推荐）

1. 下载完整包（约 127 MB，任选其一）：
   - 高速直链（国内对象存储，推荐）：
     https://personal-ai-starter-archive-20261019-1471109454.cos.ap-shanghai.myqcloud.com/aifupan/aifupan-live-recording-tool-0.1.0-full.zip
   - 或在本仓库双击 `DownloadAndRun.cmd`：脚本会自动下载、校验大小、解压并启动。
2. 解压后得到文件夹 `aifupan-live-recording-tool-0.1.0`。
3. 双击其中的 `启动录屏工作台.vbs`，浏览器自动打开 http://127.0.0.1:8765 。
4. 停止：双击同目录 `停止录屏工作台.vbs`。

## 二、完整性校验（SHA-256）

- 文件：aifupan-live-recording-tool-0.1.0-full.zip
- 大小：132,784,041 字节（126.63 MB）
- SHA-256：3AD6D4E34E4A17F46766C180E129841F269B36A919A461A6B9407130C5727E9A

PowerShell 校验：`Get-FileHash .\aifupan-live-recording-tool-0.1.0-full.zip -Algorithm SHA256`

## 三、系统要求

- Windows 10 / 11 64 位
- 已自带 Python 3.11、ffmpeg、faster-whisper，无需另外安装
- 首次启动内存占用约 800 MB（含本地转写模型）

## 四、AI 控制（可选，MCP 工具包）

本仓库根目录的 `aifupan-live-recording-tool-0.1.0.zip` 是 **MCP 控制工具包**：让 AI Agent 通过 MCP 控制已启动的录屏工作台（默认只读，写操作需 confirm），**不含引擎本体**。引擎请用上面的完整包。

## 五、关于下载方式

完整包 127 MB，超出 GitHub 单文件 100 MB 限制，故放在国内对象存储直链（永久公有读）；仓库内 `DownloadAndRun.cmd` 一键完成下载 + 校验 + 解压 + 启动，体验等同"在这里下载直接用"。

## 六、隐私

引擎完全本地运行，录制数据只保存在本机，不上传任何服务器。