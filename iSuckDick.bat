@echo off
echo Checking for vlauncher.jar in the current directory...

if exist vlauncher.jar (
    echo Yes, I detect vlauncher.jar.
    echo Attempting to run: java -Xms512M -Xmx2G -jar vlauncher.jar
    java -Xms512M -Xmx2G -jar vlauncher.jar
    if errorlevel 1 (
        echo The jar failed to launch. This might be because Java is not installed or not in PATH.
    ) else (
        echo The jar ran successfully.
    )
) else (
    echo vlauncher.jar not found in the current directory.
)

echo.
echo Press any key to close...
pause >nul
