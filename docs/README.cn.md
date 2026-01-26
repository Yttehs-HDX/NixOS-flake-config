# Nix Flake Config

[![Nix Flake CI](https://github.com/Yttehs-HDX/NixOS-flake-config/actions/workflows/ci.yml/badge.svg)](https://github.com/Yttehs-HDX/NixOS-flake-config/actions/workflows/ci.yml)

一个模块化、可复现的 Nix Flake，用于管理多主机与多用户配置，并集成 Home Manager。

## 快速开始

切换整个系统：

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

> [!WARNING]
> 这是我的个人配置，可能包含 **BUG**。
>
> 不建议直接套用，请以参考为主、按需调整。

## 关键特性

- **基于 Profile 的配置**：通过 profile 定义用户与主机，隔离各自环境与设置。
- **环境隔离**：每台主机与每个用户配置互不影响，避免相互冲突。
- **可组合模块**：按需组合 system / home / desktop 模块构建目标环境。
- **可复用逻辑**：通用逻辑集中在 `_lib/` 目录，减少重复配置。
- **声明式配置**：所有状态以 Nix 声明，保证可复现与可版本化。

## 仓库结构

- [`flake.nix`](../flake.nix) – 顶层 flake，连接 Nixpkgs、Home Manager、NUR、NixVim 等输入。
- [`hosts/`](../hosts/) – 主机配置与硬件信息（如 [`Shetty-Laptop/`](../hosts/Shetty-Laptop/)）。
- [`system/`](../system/) – NixOS 系统级模块，包括全局配置、系统软件与 home-aux。
- [`home/`](../home/) – Home Manager 用户层模块，包括全局配置与软件包。
- [`users/`](../users/) – 用户 profile（如 [`shetty/`](../users/shetty/)）。
- [`desktop/`](../desktop/) – 桌面层配置，包含：
  - [`aux/`](../desktop/aux/) – 桌面辅助组件（waybar、rofi、swaync 等）
  - [`dm/`](../desktop/dm/) – Display Manager（sddm）
  - [`sessions/`](../desktop/sessions/) – 会话/窗口管理器（hyprland）
  - [`styles/`](../desktop/styles/) – 主题与字体

## Flake Inputs

| Input | 描述 |
|-------|------|
| [nixpkgs](https://github.com/nixos/nixpkgs) | NixOS 25.11 软件包 |
| [home-manager](https://github.com/nix-community/home-manager) | 用户环境管理 |
| [nur](https://github.com/nix-community/NUR) | Nix User Repository |
| [nixvim](https://github.com/nix-community/nixvim) | Neovim 的 Nix 配置 |
| [hexecute](https://github.com/ThatOtherAndrew/Hexecute) | 自定义工具 |

## 致谢

部分配置参考自 [Sly-Harvey/NixOS](https://github.com/Sly-Harvey/NixOS)。

## 许可证

本项目采用 [MIT License](../LICENSE)。
