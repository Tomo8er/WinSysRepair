@echo off

:: 管理者権限の確認と取得
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
    echo スクリプトを管理者として実行してください
    echo 管理者権限を取得中...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

dism /Online /Cleanup-Image /Restorehealth
sfc /scannow

echo 完了しました。
pause