# 1. Load the shared key and encrypted string
$key = Get-Content "C:\Users\anavs\Anavarathan\Nokia\Learning\Encrypt-Decrypt\Diffuser\aes.key" -Encoding Byte
$cipher = Get-Content "C:\Users\anavs\Anavarathan\Nokia\Learning\Encrypt-Decrypt\Diffuser\password.enc"

# 2. Convert back to a SecureString using the shared key
$secureString = $cipher | ConvertTo-SecureString -Key $key

# 3. Decrypt to plain text (Standard PowerShell method)
$ptr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureString)
$plainText = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($ptr)

# Output the result
Write-Host "The decrypted password is: $plainText"