# Minecraft Server Repository

This repository contains the configuration, plugins, and scripts for a customized Minecraft server. It relies on the Purpur/Spigot/Paper ecosystem (implied by `purpur.yml`, `spigot.yml`) and includes custom Skripts for enhanced gameplay mechanics.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Custom Scripts (Skripts)](#custom-scripts-skripts)
- [Startup Flags](#startup-flags)
- [Maintenance and Configuration](#maintenance-and-configuration)

## Introduction

This project is a Minecraft server setup that includes:
-   **Core Server**: `server.jar` (likely Purpur or a fork).
-   **Plugins**: A collection of plugins in the `plugins/` directory to enhance gameplay, administration, and performance.
-   **Custom Scripts**: `.sk` files in `plugins/Skript/scripts/` to handle specific server logic like access control, borders, and pinatas.
-   **Optimization**: Highly tuned startup flags in `run.sh` and `run.bat` for optimal performance using the Z Garbage Collector (ZGC) and vectorization.

## Prerequisites

-   **Java Development Kit (JDK)**: A compatible Java version is required to run `server.jar`. Based on the flags used (`--add-modules=jdk.incubator.vector`), a modern JDK (likely Java 17 or newer, possibly 21+) is expected.
-   **Operating System**: Linux (for `run.sh`) or Windows (for `run.bat`).

## Installation

1.  **Clone the Repository**:
    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```

2.  **Download/Verify Server Jar**:
    Ensure `server.jar` is present in the root directory. If not, download the appropriate version of Purpur/Paper.

3.  **Permissions (Linux)**:
    Ensure the startup script is executable:
    ```bash
    chmod +x run.sh
    ```

## Usage

To start the server, run the appropriate script for your operating system. The scripts are designed to automatically restart the server if it stops or crashes.

### Linux
```bash
./run.sh
```

### Windows
Double-click `run.bat` or run it from the command prompt:
```cmd
run.bat
```

To stop the server loop, press `CTRL + C` during the 5-second countdown after the server shuts down.

## Custom Scripts (Skripts)

This server uses the Skript plugin to implement custom commands and mechanics. The scripts are located in `plugins/Skript/scripts/`.

### `allowend.sk`
**Purpose**: Manages access to The End world.
-   **Usage**: `/allowend [true|false]`
-   **Behavior**: Can enable or disable The End. If disabled, players currently in The End are teleported to the Overworld spawn.

### `border.sk`
**Purpose**: Manages the world border using ChunkyBorder and the vanilla world border.
-   **Usage**: `/border <radius>`
-   **Behavior**: Sets the Chunky border radius and the vanilla world border (2x radius).

### `help.sk`
**Purpose**: Provides a custom help command.
-   **Usage**: `/help` (Aliases: `/helps`, `/?`, `/tip`, `/tips`)
-   **Behavior**: Triggers a global auto-broadcast list of tips.

### `pinatarandom.sk`
**Purpose**: Spawns pinatas on random online players.
-   **Usage**: `/pinatarandom [amount]`
-   **Behavior**: Spawns the specified number of pinatas on randomly selected players.

### `ping.sk`
**Purpose**: A wrapper for the Spark ping command.
-   **Usage**: `/ping [player]`
-   **Behavior**: Checks latency for the executor or a target player.

### `tps.sk`
**Purpose**: A wrapper for the Spark TPS command.
-   **Usage**: `/tps`
-   **Behavior**: Displays server performance statistics (Ticks Per Second).

## Startup Flags

The `run.sh` and `run.bat` scripts utilize a comprehensive set of JVM flags optimized for:
-   **Low Latency**: Using ZGC (`-XX:+UseZGC`, `-XX:+ZGenerational`).
-   **Performance**: Vectorization modules (`jdk.incubator.vector`), aggressive memory settings, and Graal compiler optimizations.
-   **Memory**: Allocates 95% of available RAM (`-XX:MaxRAMPercentage=95.0`) with a minimum of 1GB (`-Xms1G`).

**Note**: The time zone is set to `Asia/Ho_Chi_Minh`.

## Maintenance and Configuration

### Important Settings
-   **LuckPerms**: Import the default configuration if needed:
    ```
    lp import "luckperms-naf-default.json.gz"
    ```
-   **Gamerules**: Set sleeping percentage:
    ```
    gamerule playersSleepingPercentage 25
    ```

### Optional Customizations
-   **Discord Integration**:
    -   Configure DiscordSRV in `plugins/DiscordSRV/config.yml`.
    -   Configure Voice Chat in `plugins/voicechat-discord/config.yml`.
    -   Configure GrimAC webhooks in `plugins/GrimAC/discord.yml`.
-   **Maintenance Mode**: Use `/maintenance on` to close the server to players.

### References
-   [Paper Optimization Guide](https://paper-chan.moe/paper-optimization/)
-   [Leaf Server Optimization](https://www.leafmc.one/docs/how-to/optimize-leaf-server)
-   [Java Flags by Leaf](https://www.leafmc.one/docs/how-to/java-flags)
