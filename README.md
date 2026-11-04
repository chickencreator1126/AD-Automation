# AD Onboarding Automation

PowerShell script to automate new-hire onboarding in Active Directory.
Creates a user in the target OU, sets initial password, assigns group memberships, and generates a welcome notification.

Known limitations list: No error handling, plain-text password, group must exist.

## Usage
```powershell
.\AD_NewUser.ps1 -FirstName "Jane" -LastName "Doe" -OU "Sales" -TempPassword "P@ssw0rd123"
