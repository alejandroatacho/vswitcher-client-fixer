@echo off
setlocal ENABLEDELAYEDEXPANSION

REM Set debug=1 to enable debug mode, 0 to disable
set debug=1

if "%debug%"=="1" (
    echo [DEBUG] Starting script...
)

REM Detect current Java version
if "%debug%"=="1" (
    echo [DEBUG] Running "java -version" command...
)
for /f "tokens=3 delims= " %%i in ('java -version 2^>^&1 ^| findstr /i "version"') do (
    set CURRENT_JAVA_VERSION=%%i
)

REM Remove quotes (e.g. "11.0.9" -> 11.0.9)
set CURRENT_JAVA_VERSION=%CURRENT_JAVA_VERSION:"=%

if "%debug%"=="1" (
    echo [DEBUG] Detected Java version: %CURRENT_JAVA_VERSION%
)

REM Check if Java version starts with "11"
if "%CURRENT_JAVA_VERSION:~0,2%"=="11" (
    echo Java 11 detected.
    echo.
    choice /C YN /M "Do you want to continue running vlauncher.jar with the detected Java? [Y,N]:"
    if errorlevel 2 (
        echo Operation canceled by user.
        echo Press any key to close...
        pause >nul
    ) else (
        if "%debug%"=="1" (
            echo [DEBUG] User selected to continue.
        )
        REM Set a temporary JAVA_HOME to a known JDK 11 path
        set "JAVA_HOME=C:\Program Files\Java\jdk-11.0.9"
        set "PATH=%JAVA_HOME%\bin;%PATH%"

        echo Temporarily using JAVA_HOME: %JAVA_HOME%
        echo Checking current java path...
        where java

        echo Launching vlauncher.jar with Java 11...
        java -Xms512M -Xmx2G -jar vlauncher.jar

        echo Press any key to close...
        pause >nul
    )
) else (
    echo ERROR: Java 11 not detected.
    echo Current Java version: %CURRENT_JAVA_VERSION%
    echo Please install or configure Java 11 and try again.
    echo Press any key to close...
    pause >nul
)

endlocal
