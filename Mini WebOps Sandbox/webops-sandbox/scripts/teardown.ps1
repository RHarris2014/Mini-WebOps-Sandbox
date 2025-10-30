$here = Split-Path $MyInvocation.MyCommand.Path -Parent
Set-Location "$here\.."
docker compose down -v
Write-Host "Stack stopped and volumes removed."