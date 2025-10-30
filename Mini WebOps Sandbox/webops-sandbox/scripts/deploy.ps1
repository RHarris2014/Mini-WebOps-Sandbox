# Stop on errors
$ErrorActionPreference = 'Stop'

# Go to project root (one level up from this script)
Set-Location (Join-Path $PSScriptRoot '..')

# Run compose from the project root
docker compose -f ./docker-compose.yml build
docker compose -f ./docker-compose.yml up -d

Write-Host "Stack starting. Open: http://localhost:8080/health"
