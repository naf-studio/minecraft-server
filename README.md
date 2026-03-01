# Minecraft Server Repository

This repository contains the configuration, plugins, and scripts for a customized Minecraft server.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Startup Flags](#startup-flags)
- [Maintenance and Configuration](#maintenance-and-configuration)

## Introduction

This project is a Minecraft server setup that includes:
-   **Core Server**: `server.jar` (likely Purpur or a fork).
-   **Plugins**: A collection of plugins in the `plugins/` directory to enhance gameplay, administration, and performance.
-   **Optimization**: Highly tuned startup flags in `run.sh` and `run.bat` for optimal performance using the Z Garbage Collector (ZGC) and vectorization.

## Prerequisites

-   **Java Development Kit (JDK)**: A compatible Java version is required to run `server.jar`. Based on the flags used (`--add-modules=jdk.incubator.vector`), a modern JDK (likely Java 17 or newer, possibly 21+) is expected.
-   **Operating System**: Linux (for `run.sh`) or Windows (for `run.bat`).

## Usage

To start the server, run the appropriate script for your operating system. The scripts are designed to automatically restart the server if it stops or crashes.

### Linux
```bash
./run.sh
```

### Windows
```cmd
.\run.bat
```

To stop the server loop, press `CTRL + C` during the 5-second countdown after the server shuts down.

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
