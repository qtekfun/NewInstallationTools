param (
    [string]$KeyName
)

# Pregunta por el alias del host
$HostAlias = Read-Host -Prompt "Introduce el alias del host"

# Pregunta por el hostname
$HostName = Read-Host -Prompt "Introduce el hostname"

# Pregunta por el puerto
$Port = Read-Host -Prompt "Introduce el puerto"

# Pregunta por el usuario
$User = Read-Host -Prompt "Introduce el usuario"

# Añade la entrada al fichero de configuración de ssh
$configPath = "$env:USERPROFILE/.ssh/config"
$entry = "Host $HostAlias`nHostName $HostName`nPort $Port`nUser $User`nIdentityFile ~/.ssh/$KeyName`n"
Add-Content $configPath $entry

Write-Host "Entrada añadida al fichero de configuración de ssh en $configPath"
