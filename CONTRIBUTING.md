# Contributing to Minecraft Server

Thank you for your interest in contributing to the minecraft-server project at NAF Studio. This document outlines our configuration guidelines, contribution workflow, and operational standards.

---

## 1. Branching Strategy & Workflow

This project adheres to a streamlined Trunk-based Development model:

- `main`: The stable production branch. All modifications targeting `main` must be submitted via a Pull Request (PR) and pass review.
- Working branches should be branched directly from `main` using structured naming:
  - `feat/<short-description>`: New plugin integrations, gameplay mechanics, or automation enhancements.
  - `fix/<short-description>`: Configuration corrections, permission fixes, or performance adjustments.
  - `refactor/<short-description>`: Config restructuring without behavioral modifications.
  - `chore/<short-description>`: Dependency bumps in `server-manifest.json`, script maintenance, or datapack updates.
  - `docs/<short-description>`: Documentation and setup guide revisions.

---

## 2. Commit Standards

### 2.1. Conventional Commits

All commit messages must adhere to the Conventional Commits specification:

```text
<type>(<scope>): <short description in lowercase>
```

- Allowed Types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`.
- Optional Scope: Component or plugin name (e.g., `manifest`, `geyser`, `permissions`, `scripts`).
- Description: Concise imperative sentence in lowercase without trailing punctuation.

### 2.2. Atomic Commits

- Each commit must address a single logical concern.
- Never mix formatting changes, datapack additions, and plugin configuration adjustments in the same commit.

---

## 3. Configuration & Dependency Guidelines

### 3.1. Binary Decoupling

- Never commit binary `.jar` files into the Git repository.
- To add, update, or remove server core or plugin dependencies, update `server-manifest.json`.
- The setup scripts (`setup.ps1` and `setup.sh`) read `server-manifest.json` to acquire the necessary files.

### 3.2. Configuration Hygiene

- Ensure all YAML files maintain consistent 2-space indentation and valid syntax.
- Never commit private tokens, bot secrets, or webhook URLs (use placeholders like `BOTTOKEN` or leave empty).
- Preserve runtime exclusions: world region chunks, playerdata, logs, and databases must remain untracked.

---

## 4. Pull Request Process

1. Ensure your feature branch is rebased on top of the latest `main`.
2. Verify syntax validity of all modified YAML and JSON files.
3. Open a Pull Request on GitHub. The pre-configured template will be populated automatically.
4. Provide a clear summary of your changes and reference relevant issues (e.g., `Closes #12`).
5. Merging requires maintainer approval.
