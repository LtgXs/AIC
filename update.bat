@echo off

set fv=20
set /p lv=请输入版本号：

:Run
set n=%random%
cd "%userprofile%\AppData\Local\Programs"
md temp%n%
if not exist "Clash for Windows" md "Clash for Windows"

@rem 调用powershell下载更新包
powershell (new-object System.Net.WebClient).DownloadFile('https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.%fv%.%lv%/Clash.for.Windows-0.%fv%.%lv%-win.7z','temp%n%\Clash_0.%fv%.%lv%.7z')>NUL 2>NUL
powershell (new-object System.Net.WebClient).DownloadFile('https://github.com/BoyceLig/Clash_Chinese_Patch/releases/download/0.%fv%.%lv%/app.7z','temp%n%\Patch_0.%fv%.%lv%.7z')>NUL 2>NUL
cd temp%n%
if not exist Clash_0.%fv%.%lv%.7z goto DLF
if not exist Patch_0.%fv%.%lv%.7z goto PatchDLF

@rem 调用7z解压
7z x Clash_0.%fv%.%lv%.7z
7z x Patch_0.%fv%.%lv%.7z
if not exist "Clash for Windows.exe" goto ExtF
if not exist "app.asar" goto ExtF

@rem 应用中文补丁
move /Y locales\zh-CN.pak zh-CN.pak
del /f /s /q locales\*
move zh-CN.pak locales\
move /Y app.asar resources\app.asar

@rem 应用更新
:apply
del /f /s /q LICENSE.electron.txt
del /f /s /q LICENSES.chromium.html
cd..
copy "Clash for Windows\update.bat" "temp%n%\update.bat"
taskkill /f /im "Clash for Windows.exe"
timeout /t 3
del /f /s /q "Clash for Windows\*.json"
del /f /s /q "Clash for Windows\*.dll"
del /f /s /q "Clash for Windows\*.exe"
del /f /s /q "Clash for Windows\*.dat"
del /f /s /q "Clash for Windows\*.pak"
del /f /s /q "Clash for Windows\*.bin"
del /f /s /q "Clash for Windows\*.json"
rd /s /q "Clash for Windows\resources"
timeout /t 1
xcopy /E /Y "temp%n%" "Clash for Windows"
del "Clash for Windows\Clash_0.%fv%.%lv%.7z"
del "Clash for Windows\Patch_0.%fv%.%lv%.7z"
explorer "Clash for Windows\Clash for Windows.exe"
rd /s /q temp%n%
cls&echo.&echo 更新成功&echo.
pause>NUL 2>NUL
exit


:DLF
echo.&echo 下载失败，请检查网络连接或确认正确输入版本号
cd..
rd /s /q temp%n%
pause>NUL 2>NUL
exit

:PatchDLF
echo.&set /p sl=下载汉化补丁失败，是否继续？(Y/N)
if sl==Y goto apply
if sl==N exit
exit

:ExtF
echo.&echo 解压失败
cd..
rd /s /q temp%n%
pause>NUL 2>NUL
exit