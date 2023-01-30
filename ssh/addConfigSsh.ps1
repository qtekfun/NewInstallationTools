#Preguntar por el nombre de la clave ssh si no se pasa por argumento
param (
  [string]$KeyName = $(Read-Host "Introduce el nombre de la clave ssh")
)

#Directorio donde se guardan las claves ssh
$SSHDirectory = "$env:UserProfile\.ssh"

#Comprobar si existe el archivo de configuración
if (!(Test-Path "$SSHDirectory\config")){
  New-Item "$SSHDirectory\config" -ItemType File
}

#Preguntar por los datos necesarios para agregar la entrada al archivo de configuración
$Alias = Read-Host "Introduce un alias para la entrada"
$HostName = Read-Host "Introduce el nombre del host"
$Port = Read-Host "Introduce el número de puerto"
$User = Read-Host "Introduce el nombre de usuario"

#Agregar la entrada al archivo de configuración
Add-Content "$SSHDirectory\config" "Host $Alias
  HostName $HostName
  Port $Port
  User $User
  IdentityFile $SSHDirectory\$KeyName"


Write-Host "Entrada añadida al fichero de configuración de ssh en $SSHDirectory\config"
