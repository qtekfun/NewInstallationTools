# Create the Powershell Profile
New-Item -ItemType File -Path $profile -Force

# Install Posh-Git
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force

# Copy Prompt profile
$newPrompt = Join-Path -Path $PSScriptRoot -ChildPath "Microsoft.PowerShell_profile.ps1"
Copy-Item $newPrompt $profile -Force

# Add Alias for repo
Add-Content $profile "function gotoRepo {Set-Location $env:UserProfile\repo}
new-alias repo gotoRepo"