@echo off

:: �Ǘ��Ҍ����̊m�F�Ǝ擾
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
    echo �X�N���v�g���Ǘ��҂Ƃ��Ď��s���Ă�������
    echo �Ǘ��Ҍ������擾��...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

dism /Online /Cleanup-Image /Restorehealth
sfc /scannow

echo �������܂����B
pause