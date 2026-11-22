$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$url  = "https://personal-ai-starter-archive-20261019-1471109454.cos.ap-shanghai.myqcloud.com/aifupan/aifupan-live-recording-tool-0.1.0-full.zip"
$expect = 132784041
$zip = Join-Path $here "aifupan-live-recording-tool-0.1.0-full.zip"
try {
  Write-Host "正在下载完整包 (约127MB) ..." -ForegroundColor Cyan
  if (Test-Path -LiteralPath $zip) { Remove-Item -LiteralPath $zip -Force }
  try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    (New-Object System.Net.WebClient).DownloadFile($url, $zip)
  } catch {
    Write-Host "内置下载失败，改用 curl 重试 ..." -ForegroundColor Yellow
    & curl.exe -L --fail --retry 3 -o "$zip" "$url"
    if ($LASTEXITCODE -ne 0) { throw ("curl 下载失败，退出码 " + $LASTEXITCODE) }
  }
  $sz = (Get-Item -LiteralPath $zip).Length
  if ($sz -ne $expect) { throw ("文件大小不符: $sz (应为 $expect)") }
  Write-Host "下载完成并通过大小校验。" -ForegroundColor Green
  Write-Host "正在解压 ..." -ForegroundColor Cyan
  Expand-Archive -LiteralPath $zip -DestinationPath $here -Force
  $pkg = Join-Path $here "aifupan-live-recording-tool-0.1.0"
  $vbs = Get-ChildItem -LiteralPath $pkg -Filter *.vbs | Where-Object { $_.Name -notlike "*停止*" } | Select-Object -First 1
  if (-not $vbs) { throw "未找到启动脚本 *.vbs" }
  Write-Host ("启动: " + $vbs.FullName) -ForegroundColor Cyan
  Start-Process -FilePath $vbs.FullName
  Write-Host "已启动录屏工作台，浏览器将自动打开 http://127.0.0.1:8765" -ForegroundColor Green
  Start-Sleep -Seconds 2
} catch {
  Write-Host ("出错: " + $_.Exception.Message) -ForegroundColor Red
  Read-Host "按回车退出"
  exit 1
}