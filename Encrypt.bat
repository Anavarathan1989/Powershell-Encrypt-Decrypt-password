@echo off
set /p "mypass=Enter the FTP password to lock: "

:: Use PowerShell to encrypt the string and save it to a file
powershell -command "$enc = ConvertTo-SecureString '%mypass%' -AsPlainText -Force; $enc | ConvertFrom-SecureString | Out-File 'C:\password.enc'"

echo Password has been encrypted and saved to password.enc
pause