# if PowerShell blocks execution, run following command:
# Set-ExecutionPolicy -Scope CurrentUser RemoteSigned

.\scripts\build.ps1

python -m http.server 8000 --directory _build/html