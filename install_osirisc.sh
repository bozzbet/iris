#!/data/data/com.termux/files/usr/bin/bash

set -e

# Base variables
BASE_DIR="$HOME/ccminerd"
LOG_DIR="$BASE_DIR/log"

# GitHub raw URLs
CONFIG_URL="https://raw.githubusercontent.com/bozzbet/iris/main/config.json"
OSIRISC_URL="https://raw.githubusercontent.com/bozzbet/iris/main/osirisc.sh"
CCMINER_URL="https://raw.githubusercontent.com/Darktron/pre-compiled/a73-a53/ccminer"

echo "[*] Creating ccminerd directory..."
mkdir -p "$BASE_DIR"

echo "[*] Creating log directory..."
mkdir -p "$LOG_DIR"

cd "$BASE_DIR"

echo "[*] Downloading config.json..."
curl -L -o config.json "$CONFIG_URL"

echo "[*] Downloading osirisc.sh..."
curl -L -o osirisc.sh "$OSIRISC_URL"

echo "[*] Downloading ccminer..."
wget -O ccminer "$CCMINER_URL"

echo "[*] Setting executable permissions..."
chmod +x ccminer osirisc.sh

echo "[✓] Installation complete!"
