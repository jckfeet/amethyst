@echo off
setlocal enabledelayedexpansion

:: Keep window open
if "%~1"=="" (
    cmd /k ""%~f0" restart"
    exit /b
)

title AMETHYST GAMING OPTIMIZER v7.1

:: ============================================
:: CHECK ADMIN PRIVILEGES
:: ============================================
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo.
    echo           [ERROR] Administrator privileges required!
    echo      Right-click this file and select "Run as administrator"
    echo.
    pause
    exit /b 1
)

:MAIN_MENU
cls
echo.
echo           ___    __  __    ___    _____   _   _   _   _   ____   _____ 
echo          / _ \  ^|  \/  ^|  ^|_ _^|  ^|_   _^| ^| ^| ^| ^| ^| ^| ^| ^| / ___^| ^|_   _^|
echo         / /_\ \ ^| ^|\/^| ^|   ^| ^|     ^| ^|   ^| ^|_^| ^| ^| ^| ^| ^| \___ \   ^| ^|  
echo         ^|  _  ^| ^| ^|  ^| ^|   ^| ^|     ^| ^|   ^|  _  ^| ^| ^|_^| ^|  ___) ^|  ^| ^|  
echo         ^|_^| ^|_^| ^|_^|  ^|_^|  ^|___^|    ^|_^|   ^|_^| ^|_^|  \___/  ^|____/   ^|_^|
echo.
echo              GAMING OPTIMIZER UTILITY v7.1
echo.
echo    ---------------------------------------------------------
echo.
echo         [1] General Optimizations     [2] Mouse and Keyboard    [3] Windows Tweaks
echo.
echo         [4] PC Clean                  [5] Memory Optimizations  [6] Disable Startup
echo.
echo         [7] GPU Optimizations         [8] CPU Optimizations     [9] USB Optimizations
echo.
echo         [10] Power Optimization       [11] System Debloat       [12] Storage Optimizations
echo.
echo         [13] Fix Corrupted Files      [14] Fullscreen Optimize  [15] Uninstall Useless Apps
echo.
echo         [16] Disable Animations       [17] Update Blocker       [18] Network Utility
echo.
echo.
echo    ---------------------------------------------------------
echo.
echo              [F] Fixes    [W] Complete Optimize    [P] Restore Point
echo.
echo              [R] Reverts  [X] Exit                 [E] Discord
echo.
echo.
echo         Made by AMETHYST STUDIOS (C) 2025 - Version 7.1
echo.
echo.
set /p choice="Select Option: "

if /i "%choice%"=="1" goto GENERAL_OPTIMIZATIONS
if /i "%choice%"=="2" goto MOUSE_KEYBOARD
if /i "%choice%"=="3" goto WINDOWS_TWEAKS
if /i "%choice%"=="4" goto PC_CLEAN
if /i "%choice%"=="5" goto MEMORY_OPTIMIZATIONS
if /i "%choice%"=="6" goto DISABLE_STARTUP
if /i "%choice%"=="7" goto GPU_OPTIMIZATIONS
if /i "%choice%"=="8" goto CPU_OPTIMIZATIONS
if /i "%choice%"=="9" goto USB_OPTIMIZATIONS
if /i "%choice%"=="10" goto POWER_OPTIMIZATION
if /i "%choice%"=="11" goto SYSTEM_DEBLOAT
if /i "%choice%"=="12" goto STORAGE_OPTIMIZATIONS
if /i "%choice%"=="13" goto FIX_CORRUPTED
if /i "%choice%"=="14" goto FULLSCREEN_OPTIMIZATION
if /i "%choice%"=="15" goto UNINSTALL_APPS
if /i "%choice%"=="16" goto DISABLE_ANIMATIONS
if /i "%choice%"=="17" goto UPDATE_BLOCKER
if /i "%choice%"=="18" goto NETWORK_UTILITY
if /i "%choice%"=="F" goto FIXES_MENU
if /i "%choice%"=="W" goto COMPLETE_OPTIMIZE
if /i "%choice%"=="P" goto RESTORE_POINT
if /i "%choice%"=="R" goto REVERTS_MENU
if /i "%choice%"=="X" exit /b 0
if /i "%choice%"=="E" start https://discord.gg/amethyst && goto MAIN_MENU
goto MAIN_MENU

:: ============================================
:: GENERAL OPTIMIZATIONS
:: ============================================
:GENERAL_OPTIMIZATIONS
cls
call :DRAW_HEADER "GENERAL OPTIMIZATIONS"
echo.
echo [+] Disabling unnecessary services...
call :STOP_SERVICE "SysMain" "Superfetch"
call :STOP_SERVICE "WSearch" "Windows Search"
call :STOP_SERVICE "DiagTrack" "Connected User Experiences"
call :STOP_SERVICE "dmwappushservice" "WAP Push Message Routing"
call :STOP_SERVICE "WMPNetworkSvc" "Windows Media Player Network"
call :STOP_SERVICE "Fax" "Fax Service"
call :STOP_SERVICE "MapsBroker" "Downloaded Maps Manager"
echo.
echo [+] Applying registry tweaks...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul 2>&1
echo [+] Done! Visual effects set to performance, Game DVR disabled.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: MOUSE AND KEYBOARD OPTIMIZATION
:: ============================================
:MOUSE_KEYBOARD
cls
call :DRAW_HEADER "MOUSE AND KEYBOARD OPTIMIZATION"
echo.
echo [+] Optimizing mouse settings...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseHoverTime /t REG_SZ /d 0 /f >nul 2>&1
echo [+] Optimizing keyboard settings...
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f >nul 2>&1
echo [+] Disabling mouse acceleration...
reg add "HKCU\Control Panel\Mouse" /v MouseAccel /t REG_SZ /d 0 /f >nul 2>&1
echo [+] Done! Input lag reduced.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: WINDOWS TWEAKS
:: ============================================
:WINDOWS_TWEAKS
cls
call :DRAW_HEADER "WINDOWS TWEAKS"
echo.
echo [+] Disabling transparency effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1
echo [+] Disabling animations...
reg add "HKCU\Control Panel\Desktop" /v DragFullWindows /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
echo [+] Optimizing menu show delay...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1
echo [+] Disabling Windows Error Reporting...
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1
echo [+] Done! Windows UI optimized for speed.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: PC CLEAN
:: ============================================
:PC_CLEAN
cls
call :DRAW_HEADER "PC CLEAN"
echo.
echo [+] Cleaning temporary files...
del /q /f /s %TEMP%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1
echo [+] Cleaning Prefetch...
del /q /f /s C:\Windows\Prefetch\* >nul 2>&1
echo [+] Cleaning browser cache...
rmdir /q /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" >nul 2>&1
rmdir /q /s "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*.default-release\cache2" >nul 2>&1
rmdir /q /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1
echo [+] Cleaning Windows Update cache...
net stop wuauserv >nul 2>&1
rmdir /q /s C:\Windows\SoftwareDistribution\Download >nul 2>&1
net start wuauserv >nul 2>&1
echo [+] Emptying Recycle Bin...
rd /s /q C:\$Recycle.Bin >nul 2>&1
echo [+] Done! System cleaned.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: MEMORY OPTIMIZATIONS
:: ============================================
:MEMORY_OPTIMIZATIONS
cls
call :DRAW_HEADER "MEMORY OPTIMIZATIONS"
echo.
echo [+] Optimizing memory management...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f >nul 2>&1
echo [+] Disabling Superfetch/Prefetch...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f >nul 2>&1
echo [+] Done! Memory optimized for gaming.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: DISABLE STARTUP SERVICES
:: ============================================
:DISABLE_STARTUP
cls
call :DRAW_HEADER "DISABLE STARTUP SERVICES"
echo.
echo [+] Disabling unnecessary startup services...
call :STOP_SERVICE "SysMain" "Superfetch"
call :STOP_SERVICE "WSearch" "Windows Search"
call :STOP_SERVICE "DiagTrack" "Connected User Experiences"
call :STOP_SERVICE "dmwappushservice" "WAP Push"
call :STOP_SERVICE "WMPNetworkSvc" "Windows Media Player Network"
call :STOP_SERVICE "Fax" "Fax"
call :STOP_SERVICE "MapsBroker" "Maps Manager"
call :STOP_SERVICE "WbioSrvc" "Biometric Service"
call :STOP_SERVICE "PcaSvc" "Program Compatibility"
call :STOP_SERVICE "WerSvc" "Error Reporting"
call :STOP_SERVICE "TabletInputService" "Tablet Input"
call :STOP_SERVICE "FontCache" "Font Cache"
echo [+] Done! Startup services disabled.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: GPU OPTIMIZATIONS
:: ============================================
:GPU_OPTIMIZATIONS
cls
call :DRAW_HEADER "GPU OPTIMIZATIONS"
echo.
echo [+] Detecting GPU...
wmic path win32_VideoController get name | findstr /i "NVIDIA" >nul && set "GPU=NVIDIA"
wmic path win32_VideoController get name | findstr /i "AMD" >nul && set "GPU=AMD"
wmic path win32_VideoController get name | findstr /i "Intel" >nul && set "GPU=INTEL"

if "%GPU%"=="NVIDIA" (
    echo [+] NVIDIA GPU detected, applying optimizations...
    sc config "NvTelemetryContainer" start= disabled >nul 2>&1
    sc stop "NvTelemetryContainer" >nul 2>&1
    taskkill /F /IM "NVIDIA Share.exe" >nul 2>&1
    taskkill /F /IM "nvcontainer.exe" >nul 2>&1
    reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v OptInOrOutPreference /t REG_DWORD /d 0 /f >nul 2>&1
    echo [+] NVIDIA telemetry and overlay disabled.
)

if "%GPU%"=="AMD" (
    echo [+] AMD GPU detected, applying optimizations...
    taskkill /F /IM "RadeonSoftware.exe" >nul 2>&1
    taskkill /F /IM "amdow.exe" >nul 2>&1
    reg add "HKLM\SOFTWARE\AMD\CN" /v "AutoUpdateTriggered" /t REG_DWORD /d 0 /f >nul 2>&1
    echo [+] AMD overlay and auto-update disabled.
)

if "%GPU%"=="INTEL" (
    echo [+] Intel GPU detected, applying optimizations...
    reg add "HKLM\SOFTWARE\Intel\Display\igfxcui\profiles\Gaming" /v "ForceSync" /t REG_DWORD /d 0 /f >nul 2>&1
    echo [+] Intel gaming profile applied.
)

echo [+] Enabling hardware acceleration...
reg add "HKCU\Software\Microsoft\Avalon.Graphics" /v DisableHWAcceleration /t REG_DWORD /d 0 /f >nul 2>&1
echo [+] Done! GPU optimized.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: CPU OPTIMIZATIONS
:: ============================================
:CPU_OPTIMIZATIONS
cls
call :DRAW_HEADER "CPU OPTIMIZATIONS"
echo.
echo [+] Setting high performance power plan...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo [+] Disabling core parking...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c8-534cc95951b0\0cc5b647-c1df-4637-891a-dec35c318583" /v Value /t REG_DWORD /d 0 /f >nul 2>&1
echo [+] Optimizing processor scheduling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f >nul 2>&1
echo [+] Disabling CPU throttling...
powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMIN 100 >nul 2>&1
powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMAX 100 >nul 2>&1
echo [+] Done! CPU optimized.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: USB OPTIMIZATIONS
:: ============================================
:USB_OPTIMIZATIONS
cls
call :DRAW_HEADER "USB OPTIMIZATIONS"
echo.
echo [+] Disabling USB power saving...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbhub\hubg" /v DisableSelectiveSuspend /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v DisableSelectiveSuspend /t REG_DWORD /d 1 /f >nul 2>&1
echo [+] Optimizing USB polling rate...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\hidusb\Parameters" /v HighResPollingPeriod /t REG_DWORD /d 1 /f >nul 2>&1
echo [+] Done! USB devices optimized.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: POWER OPTIMIZATION
:: ============================================
:POWER_OPTIMIZATION
cls
call :DRAW_HEADER "POWER OPTIMIZATION"
echo.
echo [+] Setting ultimate performance mode...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo [+] Disabling hibernate...
powercfg /hibernate off >nul 2>&1
echo [+] Setting never sleep...
powercfg /change monitor-timeout-ac 0 >nul 2>&1
powercfg /change standby-timeout-ac 0 >nul 2>&1
echo [+] Done! Power settings optimized.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: SYSTEM DEBLOAT
:: ============================================
:SYSTEM_DEBLOAT
cls
call :DRAW_HEADER "SYSTEM DEBLOAT"
echo.
echo [+] Removing bloatware apps...
powershell -Command "Get-AppxPackage *3dbuilder* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *windowsalarms* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *windowscalculator* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *windowscommunicationsapps* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *windowscamera* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *officehub* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *skypeapp* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *getstarted* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *zunemusic* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *windowsmaps* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *solitairecollection* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *bingfinance* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *zunevideo* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *bingnews* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *onenote* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *people* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *windowsphone* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *photos* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *windowsstore* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *bingsports* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *soundrecorder* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *bingweather* ^| Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *xboxapp* ^| Remove-AppxPackage" >nul 2>&1
echo [+] Done! Bloatware removed.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: STORAGE OPTIMIZATIONS
:: ============================================
:STORAGE_OPTIMIZATIONS
cls
call :DRAW_HEADER "STORAGE OPTIMIZATIONS"
echo.
echo [+] Optimizing drives...
defrag C: /O >nul 2>&1
echo [+] Enabling TRIM...
fsutil behavior set DisableDeleteNotify 0 >nul 2>&1
echo [+] Disabling last access timestamp...
fsutil behavior set disablelastaccess 1 >nul 2>&1
echo [+] Done! Storage optimized.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: FIX CORRUPTED FILES
:: ============================================
:FIX_CORRUPTED
cls
call :DRAW_HEADER "FIX CORRUPTED FILES"
echo.
echo [+] Running System File Checker...
sfc /scannow
echo.
echo [+] Running DISM restore health...
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo [+] Done! Corrupted files repaired.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: FULL SCREEN OPTIMIZATION
:: ============================================
:FULLSCREEN_OPTIMIZATION
cls
call :DRAW_HEADER "FULL SCREEN OPTIMIZATION"
echo.
echo [+] Disabling fullscreen optimizations...
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_DXGIHonorFSEWindowsCompatible /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f >nul 2>&1
echo [+] Disabling Game Mode...
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 0 /f >nul 2>&1
echo [+] Done! Exclusive fullscreen enabled.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: UNINSTALL USELESS APPS
:: ============================================
:UNINSTALL_APPS
cls
call :DRAW_HEADER "UNINSTALL USELESS APPS"
echo.
echo [+] Removing OneDrive...
taskkill /F /IM OneDrive.exe >nul 2>&1
%SystemRoot%\System32\OneDriveSetup.exe /uninstall >nul 2>&1
echo [+] Removing Cortana...
powershell -Command "Get-AppxPackage *Microsoft.549981C3F5F10* ^| Remove-AppxPackage" >nul 2>&1
echo [+] Removing Paint 3D...
powershell -Command "Get-AppxPackage *Microsoft.MSPaint* ^| Remove-AppxPackage" >nul 2>&1
echo [+] Removing 3D Viewer...
powershell -Command "Get-AppxPackage *Microsoft.Microsoft3DViewer* ^| Remove-AppxPackage" >nul 2>&1
echo [+] Done! Useless apps removed.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: DISABLE ANIMATIONS
:: ============================================
:DISABLE_ANIMATIONS
cls
call :DRAW_HEADER "DISABLE USELESS ANIMATIONS"
echo.
echo [+] Disabling all animations...
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewShadow /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v DragFullWindows /t REG_SZ /d 0 /f >nul 2>&1
echo [+] Disabling menu animations...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1
echo [+] Done! All animations disabled.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: UPDATE BLOCKER
:: ============================================
:UPDATE_BLOCKER
cls
call :DRAW_HEADER "WINDOWS UPDATE BLOCKER"
echo.
echo [1] Block Windows Updates
echo [2] Enable Windows Updates
echo [0] Back
echo.
set /p uchoice="Select option: "
if "%uchoice%"=="1" (
    echo [+] Blocking Windows Updates...
    sc config "wuauserv" start= disabled >nul 2>&1
    sc stop "wuauserv" >nul 2>&1
    sc config "BITS" start= disabled >nul 2>&1
    sc stop "BITS" >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f >nul 2>&1
    echo [+] Windows Updates blocked!
)
if "%uchoice%"=="2" (
    echo [+] Enabling Windows Updates...
    sc config "wuauserv" start= delayed-auto >nul 2>&1
    sc start "wuauserv" >nul 2>&1
    sc config "BITS" start= delayed-auto >nul 2>&1
    sc start "BITS" >nul 2>&1
    reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /f >nul 2>&1
    echo [+] Windows Updates enabled!
)
if "%uchoice%"=="0" goto MAIN_MENU
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: NETWORK UTILITY
:: ============================================
:NETWORK_UTILITY
cls
call :DRAW_HEADER "NETWORK TWEAKING UTILITY"
echo.
echo [+] Optimizing TCP/IP settings...
netsh int tcp set global autotuninglevel=disabled >nul 2>&1
netsh int tcp set global chimney=disabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
netsh int tcp set global netdma=enabled >nul 2>&1
netsh int tcp set global dca=enabled >nul 2>&1
netsh int tcp set global timestamps=disabled >nul 2>&1
echo [+] Disabling Nagle's Algorithm...
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do (
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v TcpAckFrequency /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v TCPNoDelay /t REG_DWORD /d 1 /f >nul 2>&1
)
echo [+] Flushing DNS...
ipconfig /flushdns >nul 2>&1
echo [+] Resetting Winsock...
netsh winsock reset >nul 2>&1
echo [+] Done! Network optimized.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: FIXES MENU
:: ============================================
:FIXES_MENU
cls
call :DRAW_HEADER "FIXES MENU"
echo.
echo [1] Fix Windows Update Issues
echo [2] Fix Store Apps Not Working
echo [3] Fix Slow Boot
echo [4] Fix High CPU Usage
echo [5] Fix High Memory Usage
echo [0] Back
echo.
set /p fchoice="Select option: "
if "%fchoice%"=="1" (
    echo [+] Fixing Windows Update...
    net stop wuauserv >nul 2>&1
    net stop cryptSvc >nul 2>&1
    net stop bits >nul 2>&1
    net stop msiserver >nul 2>&1
    ren C:\Windows\SoftwareDistribution SoftwareDistribution.old >nul 2>&1
    ren C:\Windows\System32\catroot2 catroot2.old >nul 2>&1
    net start wuauserv >nul 2>&1
    net start cryptSvc >nul 2>&1
    net start bits >nul 2>&1
    net start msiserver >nul 2>&1
    echo [+] Windows Update fixed!
)
if "%fchoice%"=="2" (
    echo [+] Fixing Store Apps...
    powershell -Command "Get-AppXPackage -AllUsers ^| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppXManifest.xml\"}" >nul 2>&1
    echo [+] Store Apps fixed!
)
if "%fchoice%"=="3" (
    echo [+] Fixing Slow Boot...
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f >nul 2>&1
    powercfg /hibernate off >nul 2>&1
    echo [+] Slow Boot fixed!
)
if "%fchoice%"=="4" (
    echo [+] Fixing High CPU Usage...
    powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
    echo [+] High CPU Usage fixed!
)
if "%fchoice%"=="5" (
    echo [+] Fixing High Memory Usage...
    taskkill /F /IM "SearchIndexer.exe" >nul 2>&1
    sc stop "WSearch" >nul 2>&1
    echo [+] High Memory Usage fixed!
)
if "%fchoice%"=="0" goto MAIN_MENU
call :DRAW_FOOTER
goto FIXES_MENU

:: ============================================
:: COMPLETE OPTIMIZE
:: ============================================
:COMPLETE_OPTIMIZE
cls
call :DRAW_HEADER "COMPLETELY OPTIMIZE YOUR PC"
echo.
echo [!] This will run ALL optimizations!
echo [!] Create a restore point first (Option P)!
echo.
echo [+] Starting in 3 seconds...
timeout /t 3 /nobreak >nul
echo.
call :STOP_SERVICE "SysMain" "Superfetch"
call :STOP_SERVICE "WSearch" "Windows Search"
call :STOP_SERVICE "DiagTrack" "Diagnostics"
call :STOP_SERVICE "dmwappushservice" "WAP Push"
echo [+] Services optimized...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul 2>&1
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
powercfg /hibernate off >nul 2>&1
echo [+] Registry and power optimized...
del /q /f /s %TEMP%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1
echo [+] Cleanup complete...
netsh int tcp set global autotuninglevel=disabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo [+] Network optimized...
echo.
echo [COMPLETE] Your PC is optimized! Restart recommended.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: RESTORE POINT
:: ============================================
:RESTORE_POINT
cls
call :DRAW_HEADER "CREATE RESTORE POINT"
echo.
echo [+] Creating system restore point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Before Gaming Optimizer", 100, 12 >nul 2>&1
if %errorlevel%==0 (
    echo [SUCCESS] Restore point created!
) else (
    echo [ERROR] Failed! Enable System Restore in System Properties.
)
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: REVERTS MENU
:: ============================================
:REVERTS_MENU
cls
call :DRAW_HEADER "REVERTS MENU"
echo.
echo [1] Revert All Optimizations
echo [2] Revert Visual Effects Only
echo [3] Revert Services Only
echo [4] Revert Registry Only
echo [0] Back
echo.
set /p rchoice="Select option: "
if "%rchoice%"=="1" goto REVERT_ALL
if "%rchoice%"=="2" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f >nul 2>&1
    echo [+] Visual effects reverted!
)
if "%rchoice%"=="3" (
    sc config "SysMain" start= auto >nul 2>&1
    sc config "WSearch" start= delayed-auto >nul 2>&1
    sc config "DiagTrack" start= auto >nul 2>&1
    echo [+] Services reverted!
)
if "%rchoice%"=="4" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 2 /f >nul 2>&1
    reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 1 /f >nul 2>&1
    echo [+] Registry reverted!
)
if "%rchoice%"=="0" goto MAIN_MENU
call :DRAW_FOOTER
goto REVERTS_MENU

:REVERT_ALL
echo [+] Reverting all changes...
sc config "SysMain" start= auto >nul 2>&1 & sc start "SysMain" >nul 2>&1
sc config "WSearch" start= delayed-auto >nul 2>&1 & sc start "WSearch" >nul 2>&1
sc config "DiagTrack" start= auto >nul 2>&1 & sc start "DiagTrack" >nul 2>&1
sc config "Themes" start= auto >nul 2>&1 & sc start "Themes" >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 1 /f >nul 2>&1
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1
powercfg /hibernate on >nul 2>&1
netsh int tcp set global autotuninglevel=normal >nul 2>&1
echo [+] All changes reverted! Restart recommended.
call :DRAW_FOOTER
goto MAIN_MENU

:: ============================================
:: HELPER FUNCTIONS
:: ============================================
:DRAW_HEADER
cls
echo.
echo           ___    __  __    ___    _____   _   _   _   _   ____   _____ 
echo          / _ \  ^|  \/  ^|  ^|_ _^|  ^|_   _^| ^| ^| ^| ^| ^| ^| ^| ^| / ___^| ^|_   _^|
echo         / /_\ \ ^| ^|\/^| ^|   ^| ^|     ^| ^|   ^| ^|_^| ^| ^| ^| ^| ^| \___ \   ^| ^|  
echo         ^|  _  ^| ^| ^|  ^| ^|   ^| ^|     ^| ^|   ^|  _  ^| ^| ^|_^| ^|  ___) ^|  ^| ^|  
echo         ^|_^| ^|_^| ^|_^|  ^|_^|  ^|___^|    ^|_^|   ^|_^| ^|_^|  \___/  ^|____/   ^|_^|
echo.
echo              GAMING OPTIMIZER UTILITY v7.1
echo.
echo    ---------------------------------------------------------
echo.
echo                              %~1
echo.
echo    ---------------------------------------------------------
echo.
goto :eof

:DRAW_FOOTER
echo.
echo    ---------------------------------------------------------
echo.
pause
goto :eof

:STOP_SERVICE
sc config "%~1" start= disabled >nul 2>&1
sc stop "%~1" >nul 2>&1
if %errorlevel%==0 (
    echo [STOPPED] %~2
) else (
    echo [ALREADY STOPPED] %~2
)
goto :eof