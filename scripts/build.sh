#!/usr/bin/env bash

set -euo pipefail

echo "==> Cleaning old builds"

rm -rf _build/html/lite
rm -rf _output

echo "==> Building Jupyter Book"

jupyter-book build --html

echo "==> Building JupyterLite"

jupyter lite build

echo "==> Integrating JupyterLite into Jupyter Book"

mkdir -p _build/html/lite

cp -a _output/. _build/html/lite/

echo "==> Build complete"

echo ""
echo "Book:"
echo "  _build/html/index.html"
echo ""
echo "JupyterLite:"
echo "  _build/html/lite/lab/index.html"