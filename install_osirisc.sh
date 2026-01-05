#!/data/data/com.termux/files/usr/bin/bash

set -e

#exec </dev/tty || true
#export DEBIAN_FRONTEND=noninteractive

# INSTALL PKG's
echo "[*] Executing pkg update -y.."
apt update -y
echo "[*] Executing pkg upgrade -y.."
apt upgrade -y
echo "[*] pkg install wget -y .."
apt install wget -y    
echo "[*] Executing pkg install curl -y.."
apt install curl -y
echo "[*] Executing pkg install libjansson -y.."
apt install libjansson -y
echo "[*] Executing pkg install termux-api -y.."
apt install termux-api -y

echo "[*] Start Installing and Setting Up the Verus Miner..."

# Base variables
BASE_DIR="$HOME/ccminerd"
LOG_DIR="$BASE_DIR/log"

# GitHub raw URLs
CONFIG_URL="https://raw.githubusercontent.com/bozzbet/iris/main/config.json"
START_OSIRISC_URL="https://raw.githubusercontent.com/bozzbet/iris/main/start_iris.sh"
START_OSIRISCBUF_URL="https://raw.githubusercontent.com/bozzbet/iris/main/start_irisbuf.sh"
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

echo "[*] Downloading start_irisbuf.sh..."
curl -L -o start_irisbuf.sh "$START_OSIRISCBUF_URL"

echo "[*] Downloading stop_iris.sh..."
curl -L -o stop_iris.sh "$STOP_OSIRISC_URL"

echo "[*] Downloading ccminer..."
wget -O ccminer "$CCMINER_URL"

echo "[*] Setting executable permissions..."
chmod +x ccminer 
chmod +x start_iris.sh
chmod +x stop_iris.sh
chmod +x start_irisbuf.sh

echo "[✓] Installation complete!"
