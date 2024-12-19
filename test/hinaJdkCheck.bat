@echo off
echo ============================================
echo          HinaSupport: Java JDK Installation Check
echo ============================================

echo.

:: Check if JAVA_HOME is set
if defined JAVA_HOME (
    echo JAVA_HOME: %JAVA_HOME%
    if exist "%JAVA_HOME%\bin\javac.exe" (
        echo [OK] javac.exe found in JAVA_HOME\bin
    ) else (
        echo [WARNING] javac.exe NOT found in JAVA_HOME\bin
    )
) else (
    echo [WARNING] JAVA_HOME is not set.
)

echo.

:: Check if javac is in PATH
where javac >nul 2>&1
if %ERRORLEVEL%==0 (
    echo [OK] javac is available in PATH.
    javac -version
) else (
    echo [ERROR] javac is NOT available in PATH.
)

echo.

:: Check if java is in PATH
where java >nul 2>&1
if %ERRORLEVEL%==0 (
    echo [OK] java is available in PATH.
    java -version
) else (
    echo [ERROR] java is NOT available in PATH.
)

echo.
echo ============================================
echo   Java JDK Check Completed, SMD If it failed
echo ============================================

pause
