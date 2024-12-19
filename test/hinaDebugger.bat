@echo off
set LOG_FILE=error_log.txt
java -jar vlauncher.jar > "%LOG_FILE%" 2>&1
echo Execution finished. Press any key to open the log file...
pause
start "" "%LOG_FILE%"