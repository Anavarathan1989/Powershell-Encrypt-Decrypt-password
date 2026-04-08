@echo off
:: This line reads the 'password.enc' file and turns it back into plain text
for /f "usebackq delims=" %%a in (`powershell -command "$cipher = Get-Content 'C:\password.enc'; $ptr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR((ConvertTo-SecureString $cipher)); [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($ptr)"`) do set "decrypted_pass=%%a"

echo The password has been recovered : %decrypted_pass%

pause