# AD Onboarding Automation

PowerShell script to automate new-hire onboarding in Active Directory.
Creates a user in the target OU, sets initial password, assigns group memberships, and generates a welcome notification.

## Usage
```powershell
.\AD_NewUser.ps1 -FirstName "Jane" -LastName "Doe" -OU "Sales" -TempPassword "P@ssw0rd123"   
