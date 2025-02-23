# Universal Development Container

A persistent, customizable Docker-based development environment that keeps your host machine clean. Supports any programming language/tool installed manually via command line.

## Features

- 🐳 **Docker-based isolation** - No host machine pollution
- 💾 **Full persistence** - Installed packages survive container restarts/rebuilds
- 🎨 **Pre-configured Zsh environment** with:
  - Oh My Zsh
  - Powerlevel10k theme
  - Persistent command history
- 🔧 **Ready for any language**:
  - Python, Node.js, Java, Rust, Go, etc.
  - Built-in build essentials (gcc, make, etc)
- 📂 **Volume management**:
  - Workspace directory synced with host
  - Separate volume for user configurations

## Quick Start

### Prerequisites
- Docker Engine ≥ 20.10
- Docker Compose ≥ 2.17

### 1. Strart the environemnt
  ```docker-compose up -d --build```
### 2. Access the container
```docker exec -it universal-dev zsh```

  

