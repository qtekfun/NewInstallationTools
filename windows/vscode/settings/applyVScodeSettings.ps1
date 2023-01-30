# Obtenga la ubicación del archivo de configuración actual
$vscodeSettings = "$env:APPDATA\Code\User\settings.json"

# Obtenga la ubicación del nuevo archivo de configuración
$newSettings = Join-Path -Path $PSScriptRoot -ChildPath "settings.json"

# Compruebe si el nuevo archivo de configuración existe
if (Test-Path $newSettings) {
    # Copie el nuevo archivo de configuración a la ubicación del archivo de configuración actual
    Copy-Item $newSettings $vscodeSettings -Force

    # Muestra un mensaje de éxito
    Write-Host "La configuración de Visual Studio Code ha sido reemplazada con éxito con el archivo $newSettings"
} else {
    # Muestra un mensaje de error
    Write-Host "No se encontró el archivo $newSettings" -ForegroundColor Red
}
