# AD_NewUser.ps1
# Run as Domain Admin on DC01

param(
    [string]$FirstName,
    [string]$LastName,
    [string]$OU,
    [string]$TempPassword
)

# Build the full DN for the OU
$ouPath = "OU=$OU,DC=homedomain,DC=local"

# Create the user
$sAMAccountName = $FirstName.Substring(0,1) + $LastName.ToLower()
$displayName = "$FirstName $LastName"
$userPrincipalName = "$sAMAccountName@homedomain.local"

New-ADUser `
    -Name "$LastName, $FirstName" `
    -SamAccountName $sAMAccountName `
    -GivenName $FirstName `
    -Surname $LastName `
    -UserPrincipalName $userPrincipalName `
    -Path $ouPath `
    -AccountPassword (ConvertTo-SecureString $TempPassword -AsPlainText -Force) `
    -ChangePasswordAtLogon $true `
    -Enabled $true

# Write confirmation
Write-Host "Created: $displayName ($sAMAccountName) in $OU" -ForegroundColor Green

# Simulate welcome email (replace with Send-MailMessage if you have SMTP)
$welcomeBody = @"
Hello $FirstName,

Your account ($sAMAccountName) has been created.
Please change your password at first login.

- IT Helpdesk
"@

# If you have an SMTP server:
# Send-MailMessage -To "$userPrincipalName" -From "it@homedomain.local" `
#     -Subject "Welcome to the network" -Body $welcomeBody `
#     -SmtpServer "mail.homedomain.local"

Write-Host "Welcome message prepared for $userPrincipalName"   