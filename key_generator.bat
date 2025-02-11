@echo off
setlocal enabledelayedexpansion

:: Define character set
set "charset=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

:: Generate 20 keys
for /L %%X in (1,1,20) do (
    set "key="
    
    :: Generate 5 blocks of 5 characters
    for /L %%A in (1,1,5) do (
        set "block="
        for /L %%B in (1,1,5) do (
            set /A "rand=!random! %% 36"
            for %%C in (!rand!) do set "block=!block!!charset:~%%C,1!"
        )
        if defined key (set "key=!key!-!block!") else (set "key=!block!")
    )
    echo !key!
)

endlocal
