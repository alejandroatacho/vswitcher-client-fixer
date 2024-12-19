@echo off
setlocal
set JAVA_HOME="C:\Program Files\Java\jdk-11.0.9"
set PATH=%JAVA_HOME%\bin;%PATH%
"%JAVA_HOME%\bin\java.exe" -jar vlauncher.jar
endlocal
