@echo off
setlocal enabledelayedexpansion

call .\path_env_var.bat

set /p "result=" < temp_file.txt

echo .
echo ...................
echo list of your paths
echo ...................

rem Replace semicolons with spaces to separate the path elements
set "path_string=!result:;= !"

rem Loop through the path elements and print each one
for %%i in (!path_string!) do (
	echo "%%i"
)

del temp_file.txt

echo .
echo .

endlocal