@echo off
setlocal enabledelayedexpansion

for /f "tokens=2,*" %%I in ('reg query "HKCU\Environment" /v PATH ^| find "REG_SZ"') do (
	set "RETURNED_ENV_VAR=%%J"
)

echo !RETURNED_ENV_VAR! > temp_file.txt

endlocal