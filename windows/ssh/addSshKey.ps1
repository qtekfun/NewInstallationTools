if ($args.Count -lt 1 -or $args[0] -eq "-h") {
  Write-Host "Usage: .\generate-ssh-key.ps1 <key-name> [email]"
  Write-Host "Generates a new ed25519 SSH key with the specified name and email address."
  Write-Host "The email address can be specified as a command line argument or entered interactively."
  return
}

$keyName = $args[0]
$email = $args[1]

if (!$email) {
  $email = Read-Host "Enter your email address"
}

$keyPath = "$env:USERPROFILE\.ssh\$keyName"

if (Test-Path -Path "$keyPath") {
  $choice = Read-Host "SSH key already exists. Do you want to regenerate it? (yes/no, default no)"

  if ($choice -eq "yes") {
    ssh-keygen -t ed25519 -f "$keyPath" -C "$email" -N ""
    ssh-add "$keyPath"
  }
}
else {
  ssh-keygen -t ed25519 -f "$keyPath" -C "$email"
  ssh-add "$keyPath"

  # Start the OpenSSH ssh-agent service
  if (!(Get-Service ssh-agent | Select-Object -ExpandProperty Status) -eq "Running") {
    Start-Service ssh-agent | Out-Null
    Set-Service -Name ssh-agent -StartupType DelayedStart | Out-Null
  }
}

$publicKey = Get-Content "$keyPath.pub"

$choice = Read-Host "Do you want to show the public key, copy it to a remote server, or do nothing? (show/copy/nothing, default nothing)"

if ($choice -eq "show") {
  Write-Host $publicKey
}
elseif ($choice -eq "copy") {
  $username = Read-Host "Enter the remote server username"
  $ipAddress = Read-Host "Enter the remote server IP address"
  $port = Read-Host "Enter the remote server SSH port (default 22)"
  $port = $port -eq "" ? 22 : $port

  ssh $username@$ipAddress -p $port "echo $publicKey >> ~/.ssh/authorized_keys"
}
elseif ($choice -eq "nothing") {
  Write-Host "Not doing anything with the public key."
}
else {
  Write-Host "Invalid option. Not doing anything with the public key."
}

