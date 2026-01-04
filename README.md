# One-Line Install Command
```bash
  curl -fsSL https://raw.githubusercontent.com/bozzbet/iris/main/install_osirisc.sh | bash
```
## How To Start The Miner
```bash
  cd ccminerd
  ./start_iris.sh
```
## How To View Progress On Phone
```bash
  tail -f ~/ccminerd/log/ccminer.log
```
## How To Stop The Miner
```bash
  kill "$(cat ~/ccminer.pid)"
```
  OR
```bash
  ./stop_iris.sh
```
## Check If The Miner Is Running
```bash
  ps -p "$(cat ~/ccminer.pid)"
```
