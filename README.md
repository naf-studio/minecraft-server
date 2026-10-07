# NAF Studio - Minecraft Server

[![Minecraft](https://img.shields.io/badge/Minecraft-1.21.11-brightgreen.svg)](https://papermc.io/)
[![Server Core](https://img.shields.io/badge/Core-LeafMC-00AF5C.svg)](https://github.com/Winds-Studio/Leaf)
[![Java](https://img.shields.io/badge/Java-21_--_25-orange.svg)](https://adoptium.net/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Production server configurations, LeafMC environment setup, and deployment scripts for the NAF Minecraft Server (Season 8, Minecraft 1.21.11). Built on LeafMC for high performance, rich world generation, and cross-platform Bedrock support.

---

## 1. Architectural Overview & System Design

```text
minecraft-server/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   └── pull_request_template.md
├── config/
├── plugins/
├── world/
│   └── datapacks/
├── world_nether/
├── world_the_end/
├── .editorconfig
├── .gitattributes
├── .gitignore
├── CONTRIBUTING.md
├── LICENSE
├── run.ps1
├── run.sh
├── server-manifest.json
├── setup.ps1
├── setup.sh
└── README.md
```

### Engineering Decisions & Standards

- Decouples binary JAR files from version control, maintaining repository history under lightweight text configurations.
- Declares server core and plugin dependencies in `server-manifest.json`, providing a machine-readable single source of truth.
- Provides cross-platform automated setup scripts (`setup.ps1` for Windows, `setup.sh` for Linux) that download and verify all dependencies.
- Standardizes production startup scripts on modern PowerShell (`run.ps1`) and Bash (`run.sh`) with synchronized meowice-flags and crash restart loops.
- Enforces strict `.gitignore` rules that prevent runtime churn (world chunks, player data, logs, databases) from polluting Git history.

---

## 2. Quick Start

### 1. Download Dependencies

Run the setup script for your operating system to download the Leaf server core and plugins:

On Linux:

```bash
chmod +x setup.sh run.sh
./setup.sh
```

On Windows (PowerShell):

```powershell
.\setup.ps1
```

> [!NOTE]
> CMI is a commercial plugin. If utilizing CMI, place your licensed JAR file into `plugins/` prior to launch.

### 2. Launch Server

On Linux:

```bash
chmod +x run.sh
./run.sh
```

On Windows (PowerShell):

```powershell
.\run.ps1
```

To stop the auto-restart loop, press `Ctrl + C` during the 5-second countdown after the server stops.

---

## 3. Initial Configuration & Administration

### Permissions Setup

Import the bundled default LuckPerms configuration from the console:

```bash
lp import luckperms-naf-default.json.gz
```

### Gamerules

```bash
gamerule players_sleeping_percentage 25
```

### World Borders & Chunk Pre-generation

Execute the following commands from the console to establish world boundaries and pre-generate chunks safely:

#### Overworld

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

#### The Nether

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

#### The End

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

#### Limbo

```bash
execute in minecraft:limbo run gamerule locator_bar false
```

### Maintenance Mode

- Enable: `cmi maintenance on`
- Disable: `cmi maintenance off`

---

## 4. Security & Sensitive Tokens

Ensure the following configuration files are updated with your server credentials:

- DiscordSRV: Bot token and channel IDs in `plugins/DiscordSRV/config.yml`.
- GrimAC: Webhook URLs in `plugins/GrimAC/discord.yml`.

---

## 5. Network & Port Mapping

Ensure the following ports are open or mapped in your firewall:

- Minecraft Java: `25565/tcp`
- Bedrock (Geyser): `19132/udp` (configured in `plugins/Geyser-Spigot/config.yml`)
- Simple Voice Chat: UDP port configured in `plugins/voicechat/config.yml`

---

## 6. Optimization & Credits

Server performance tuning and JVM optimization are powered by:

- [Leaf](https://github.com/Winds-Studio/Leaf)
- [meowice-flags](https://github.com/MeowIce/meowice-flags)
- [Paper Optimization Guide](https://paper-chan.moe/paper-optimization/)
- [Leaf Server Optimization](https://www.leafmc.one/docs/how-to/optimize-leaf-server)

---

## 7. Contributing

Contributions must follow the standards outlined in [CONTRIBUTING.md](CONTRIBUTING.md).

---

## 8. License

This project is licensed under the [MIT License](LICENSE). Copyright &copy; 2022 [naipret](https://github.com/naipret).
