@echo off

setlocal enabledelayedexpansion

call .\name.bat

set "current_dir=%cd%"

rem takes the name of the env variable
set /P "set_or_print=Set Env Variable - [y] >>> OR <<< Print Env Variable - [n]: "

if /i "%set_or_print%" equ "n" (
    call print_env.bat
) else if /i "%set_or_print%" equ "Y" (
    call set_path.bat
) else (
    echo Select [y/N]
)

cd %current_dir%
exit \0

endlocal
