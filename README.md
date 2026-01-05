# **Setting Up Android Phone for Verus Mining**

# Pre-Installation Requirements
Install Termux Application the Android Phone.
## Upgrade Packages in Termux
```bash
  apt update -y
  apt upgrade -y
```
## One-Line Install Command
Execute the `curl` statement to install required packages and setup the Verus Miner. 
```bash
  curl -fsSL https://raw.githubusercontent.com/bozzbet/iris/main/install_osirisc.sh | bash
```

# Post-Install Procedure
Basic User Guide to run the Verus Miner

## Update the `config` file for the Miner's setting
Parameters:
- <pool_name_1> and <pool_name_2>
- <pool_1> and <pool_2>
- <wallet_address>.<miner_name>
- "api-allow": <to_your_IP_range>
- "threads": <to_your_miners_desired_#_of_threads>

```bash
  cd ~/ccminerd
  nano config.json
```
Configuration `config.json` File Template
```bash
  {
  	"pools":[
  	{
  		"name": "<pool_name_1>",
          "url": "stratum+tcp://<pool_1>:<port>",
  		"timeout": 150,
  		"disabled": 0
  	},
  	{
  		"name": "<pool_name_2>",
          "url": "stratum+tcp://<pool_2>:<port>",
  		"timeout": 60,
  		"time-limit": 600,
  		"disabled": 0
  	}],
  	"user": "<wallet_address>.<miner_name>",
  	"algo": "verus",
  	"threads": 8,
  	"cpu-priority": 1,
  	"retry-pause": 5,
  	"api-allow": "192.168.0.0/16",
  	"api-bind": "0.0.0.0:4068"
  }
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
  or,
```bash
  ./stop_iris.sh
```
## Check If The Miner Process Is Running
```bash
  ps -p "$(cat ~/ccminer.pid)"
```
