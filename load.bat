@echo off
setlocal enabledelayedexpansion

:: 配置参数
set QT_DIR=G:\Qt\5.15.2\msvc2019_64
set EXE_PATH=HvFrontEnd.exe
set OUTPUT_DIR=Deploy_x64

:: 清理旧部署
rmdir /s /q "%OUTPUT_DIR%" 2>nul
mkdir "%OUTPUT_DIR%"
copy "%EXE_PATH%" "%OUTPUT_DIR%\" >nul

:: 设置纯净环境
set ORIG_PATH=%PATH%
set PATH=%QT_DIR%\bin;C:\Windows\System32

:: 执行部署
echo 正在部署64位依赖项...
"%QT_DIR%\bin\windeployqt.exe" ^
  --release ^
  --no-compiler-runtime ^
  --no-translations ^
  --dir "%OUTPUT_DIR%" ^
  "%OUTPUT_DIR%\%EXE_PATH%"

:: 额外添加VC++运行时（手动）
copy "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Redist\MSVC\14.29.30133\x64\*.dll" "%OUTPUT_DIR%\" >nul

:: 验证结果
echo 验证部署架构:
dumpbin /headers "%OUTPUT_DIR%\Qt5Core.dll" | findstr machine

:: 恢复环境
set PATH=%ORIG_PATH%
echo 部署完成到 %OUTPUT_DIR% 目录
