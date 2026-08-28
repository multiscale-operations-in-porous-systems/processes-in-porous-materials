# if PowerShell blocks execution, run following command:
# Set-ExecutionPolicy -Scope CurrentUser RemoteSigned

$ErrorActionPreference = "Stop"

Write-Host "==> Cleaning old builds"

if (Test-Path "_build/html/lite") {
    Remove-Item "_build/html/lite" -Recurse -Force
}

if (Test-Path "_output") {
    Remove-Item "_output" -Recurse -Force
}

Write-Host "==> Building Jupyter Book"

jupyter-book build --html

Write-Host "==> Building JupyterLite"

jupyter lite build

Write-Host "==> Integrating JupyterLite into Jupyter Book"

New-Item -ItemType Directory -Force -Path "_build/html/lite" | Out-Null

Copy-Item `
    -Path "_output/*" `
    -Destination "_build/html/lite" `
    -Recurse `
    -Force

Write-Host "==> Build complete"
Write-Host ""
Write-Host "Book:"
Write-Host "  _build/html/index.html"
Write-Host ""
Write-Host "JupyterLite:"
Write-Host "  _build/html/lite/lab/index.html"