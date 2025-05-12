@echo off
Setlocal enabledelayedexpansion
for /f "skip=2 delims=: tokens=1,*" %%i in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyEnable"') do (set str=%%i)
set a=%str:~-3%
echo %a%
if "%a%"=="0x1" (reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f)
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable

