@echo off
setlocal

echo ==> Cleaning old builds

if exist "_build\html\lite" (
    rmdir /s /q "_build\html\lite"
)

if exist "_output" (
    rmdir /s /q "_output"
)

echo.
echo ==> Building Jupyter Book

jupyter-book build --html
if errorlevel 1 goto :error

echo.
echo ==> Building JupyterLite

jupyter lite build
if errorlevel 1 goto :error

echo.
echo ==> Integrating JupyterLite into Jupyter Book

if not exist "_build\html\lite" (
    mkdir "_build\html\lite"
)

xcopy "_output\*" "_build\html\lite\" /e /i /y >nul
if errorlevel 1 goto :error

echo.
echo ==> Build complete
echo.
echo Book:
echo   _build\html\index.html
echo.
echo JupyterLite:
echo   _build\html\lite\lab\index.html

goto :eof

:error
echo.
echo ERROR: Build failed.
exit /b 1