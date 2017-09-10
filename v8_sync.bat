echo ============== Sync V8 ===============
gclient sync
if "%ERRORLEVEL%"=="0" (goto BuildV8) else echo Warning: Error Occured When SyncV8