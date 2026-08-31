@echo off
call scripts\build.bat

echo.
echo Starting server at:
echo http://localhost:8000
echo.

python -m http.server 8000 --directory _build/html