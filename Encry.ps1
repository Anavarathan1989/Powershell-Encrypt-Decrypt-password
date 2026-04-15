# 1. Define where to save the files
$passwordFile = "C:\password.enc"
$keyFile = "C:\aes.key"

# 2. Generate a random 32-byte (256-bit) key
$key = New-Object Byte[] 32
[Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($key)
$key | Set-Content -Path $keyFile -Encoding Byte

# 3. Encrypt the password using the key
$plainText = "YourSecretPassword123"
$secureString = $plainText | ConvertTo-SecureString -AsPlainText -Force
$encryptedString = ConvertFrom-SecureString -SecureString $secureString -Key $key

# 4. Save the encrypted string to a file
$encryptedString | Out-File -FilePath $passwordFile