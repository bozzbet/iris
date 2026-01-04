#!/data/data/com.termux/files/usr/bin/bash

# ---------- Environment (important for adb) ----------
export PREFIX=/data/data/com.termux/files/usr
export HOME=/data/data/com.termux/files/home
export PATH=$PREFIX/bin:$PATH

# ---------- Config ----------
CCMINER_DIR="$HOME/ccminerd"
LOG="$CCMINER_DIR/log/ccminer.log"
PIDFILE="$HOME/ccminer.pid"
MAX_LINES=100   # how many log lines to keep

# ---------- Setup ----------
mkdir -p "$(dirname "$LOG")"
cd "$CCMINER_DIR" || exit 1

# ---------- Stop existing miner (cleanly) ----------
if [ -f "$PIDFILE" ] && ps -p "$(cat "$PIDFILE")" >/dev/null 2>&1; then
    echo "Stopping existing miner (PID $(cat "$PIDFILE"))"
    kill -INT "$(cat "$PIDFILE")"
    sleep 2
fi

# ---------- Prevent sleep ----------
termux-wake-lock

# ---------- Clear log once on start ----------
: > "$LOG"

# ---------- Start miner with fake TTY + bounded log ----------
# script provides a pseudo-TTY
# tail keeps the log bounded (NO file truncation)
script -q -c "./ccminer -c config.json | stdbuf -oL tail -n $MAX_LINES" "$LOG" &

PID=$!
echo "$PID" > "$PIDFILE"

# ---------- Info ----------
printf '\nMining started.\n'
printf '===============\n'
printf 'PID: %s\n' "$PID"
printf 'Log: %s (last %s lines)\n\n' "$LOG" "$MAX_LINES"
