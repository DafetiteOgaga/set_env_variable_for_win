@echo off
setlocal enabledelayedexpansion

set "current_dir=%cd%"

set /P "custom_command=Enter name of directory: "
rem set "custom_command=xbin_windows"

set "NEW_ENV_VAR=C:\Users\%username%\%custom_command%"

echo ....................................................................
if exist "%NEW_ENV_VAR%" (
	echo variable path ok ...
) else (
	echo creating variable path ...
	mkdir %NEW_ENV_VAR%
)

cd %NEW_ENV_VAR%
echo ....................................................................
echo NEW_ENV_VAR: %NEW_ENV_VAR%
echo ....................................................................

for /f "tokens=2,*" %%I in ('reg query "HKCU\Environment" /v PATH ^| find "REG_SZ"') do (
    set "CURRENT_ENV_VAR=%%J"
)

rem Check if the new path is already in the current path
echo %result% | find /i "%NEW_ENV_VAR%" > nul
if errorlevel 1 (
	rem Append the new path to the existing PATH
	setx PATH "%CURRENT_ENV_VAR%;%NEW_ENV_VAR%"
	echo variable PATH updated successfully!...##############################
) else (
	echo New variable already exists in the current PATH...##################
)

echo ....................................................................

cd %current_dir%
call .\print_env.bat

endlocal