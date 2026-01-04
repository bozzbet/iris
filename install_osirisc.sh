#!/data/data/com.termux/files/usr/bin/bash

set -e

# INSTALL PKG's
pkg update -y
pkg upgrade -y
pkg install wget -y    -api
pkg install curl -y
pkg install libjansson -y
pkg install termux -y

# Base variables
BASE_DIR="$HOME/ccminerd"
LOG_DIR="$BASE_DIR/log"

# GitHub raw URLs
CONFIG_URL="https://raw.githubusercontent.com/bozzbet/iris/main/config.json"
START_OSIRISC_URL="https://raw.githubusercontent.com/bozzbet/iris/main/start_iris.sh"
STOP_OSIRISC_URL="https://raw.githubusercontent.com/bozzbet/iris/main/stop_iris.sh"
CCMINER_URL="https://raw.githubusercontent.com/Darktron/pre-compiled/a73-a53/ccminer"

echo "[*] Creating ccminerd directory..."
mkdir -p "$BASE_DIR"

echo "[*] Creating log directory..."
mkdir -p "$LOG_DIR"

cd "$BASE_DIR"

echo "[*] Downloading config.json..."
curl -L -o config.json "$CONFIG_URL"

echo "[*] Downloading start_iris.sh..."
curl -L -o start_iris.sh "$START_OSIRISC_URL"

echo "[*] Downloading stop_iris.sh..."
curl -L -o stop_iris.sh "$STOP_OSIRISC_URL"

echo "[*] Downloading ccminer..."
wget -O ccminer "$CCMINER_URL"

echo "[*] Setting executable permissions..."
chmod +x ccminer start_iris.sh
chmod +x ccminer stop_iris.sh

echo "[✓] Installation complete!"
