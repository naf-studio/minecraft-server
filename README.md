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

#### 1. Permissions

```bash
lp import "luckperms-naf-default.json.gz"
```

#### 2. Gamerule

```bash
gamerule players_sleeping_percentage 25
```

### 🗺️ World Borders & Pre-generation

To configure the world borders, set up selections, and start pre-generation safely from the console, execute the following commands:

#### 1. Overworld

```bash
execute in minecraft:overworld run gamerule locator_bar false
execute in minecraft:overworld run worldborder center 0 0
execute in minecraft:overworld run worldborder set 20000
chunky world world
chunky center 0 0
chunky radius 10000
chunky border add
chunky start
```

#### 2. Nether

```bash
execute in minecraft:the_nether run gamerule locator_bar false
execute in minecraft:the_nether run worldborder center 0 0
execute in minecraft:the_nether run worldborder set 20000
chunky world world_nether
chunky center 0 0
chunky radius 10000
chunky border add
chunky start
```

#### 3. The End

```bash
execute in minecraft:the_end run gamerule locator_bar false
execute in minecraft:the_end run worldborder center 0 0
execute in minecraft:the_end run worldborder set 20000
chunky world world_the_end
chunky center 0 0
chunky radius 10000
chunky border add
chunky start
```

#### 4. Limbo

```bash
execute in minecraft:limbo run gamerule locator_bar false
```

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
