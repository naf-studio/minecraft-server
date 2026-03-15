# 🌲 NAF Minecraft Server

This repository contains the complete configuration, plugin suite, and optimized scripts for the **NAF Minecraft Server**. Built on **LeafMC**, this setup is designed for high performance, rich world generation, and seamless integration between platforms.

---

## 🚀 Quick Start

To launch the server, use the startup script corresponding to your operating system. These scripts ensure the server automatically restarts in case of a crash.

### 🐧 Linux
```bash
./run.sh
```

### 🪟 Windows
```cmd
.\run.bat
```

> **Note**: To stop the auto-restart loop, press `CTRL + C` during the 5-second countdown after the server stops.

---

## ⚙️ Configuration

### 🧩 Initial Setup
After the first launch, run these commands in the console:
- **Permissions**: `lp import "luckperms-naf-default.json.gz"`
- **Gamerule**: `gamerule playersSleepingPercentage 25`

### 🔧 Maintenance Mode
- **Enable**: `cmi maintenance on` (Closes server to players)
- **Disable**: `cmi maintenance off` (Opens server to players)

### 🔑 Security & Tokens
Configure the following sensitive information in their respective YAML files:
- **DiscordSRV**: Bot token and channel IDs in `plugins/DiscordSRV/config.yml`.
- **GrimAC**: Webhook URLs in `plugins/GrimAC/discord.yml`.

### 🌐 Network & Ports
Ensure the following ports are correctly mapped/forwarded:
- **Voice Chat**: Set port in `plugins/voicechat-discord/config.yml`.
- **Bedrock (Geyser)**: Set port in `plugins/Geyser-Spigot/config.yml`.

---

## 📑 Server Specifications

For a comprehensive documentation of the integrated infrastructure, including the server forks, full list of plugins, datapacks, please refer to:
- [LIST.md](LIST.md)

---

## 📈 Optimization & Credits

The performance of this server is made possible by the following resources:

- **JVM Flags**: Optimized using [meowice-flags](https://github.com/MeowIce/meowice-flags).
- **Optimization Guides**:
  - [Paper Optimization Guide](https://paper-chan.moe/paper-optimization/)
  - [Leaf Server Optimization](https://www.leafmc.one/docs/how-to/optimize-leaf-server)
  - [Java Flags by Leaf](https://www.leafmc.one/docs/how-to/java-flags)

---
*Created and maintained by the NAF Team.*
