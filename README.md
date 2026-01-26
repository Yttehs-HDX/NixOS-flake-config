# Nix Flake Config
[![Nix Flake CI](https://github.com/Yttehs-HDX/NixOS-flake-config/actions/workflows/ci.yml/badge.svg)](https://github.com/Yttehs-HDX/NixOS-flake-config/actions/workflows/ci.yml)

A modular, reproducible Nix Flake for managing multi-host and multi-user configurations, with Home Manager integration.

## Getting Started
Apply the system configuration for a host:

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

> [!WARNING]
> This is my personal config and may still contain **BUGS**.
>
> It is not recommended to use it directly. Use it as a reference and adjust as needed.

## Key Features
- **profile-driven** – Define users and hosts via profiles to isolate environments and settings.
- **Environment isolation** – Host and user configurations are independent, reducing conflicts.
- **Modular composition** – Combine system / home / desktop modules as needed.
- **Reusable logic** – Common logic lives under `_lib/` to reduce duplication.
- **Declarative configuration** – All state is defined in Nix, making it reproducible and versioned.

## Repository Layout
- [`flake.nix`](flake.nix) – top-level flake aggregating Nixpkgs, Home Manager, NUR, NixVim, and other inputs.
- [`hosts/`](hosts/) – host configuration and hardware info (e.g., [`Shetty-Laptop/`](hosts/Shetty-Laptop/)).
- [`system/`](system/) – NixOS system-level modules: global config, system software, and home-aux.
- [`home/`](home/) – Home Manager user-level modules: global config and packages.
- [`users/`](users/) – user profile definitions (e.g., [`shetty/`](users/shetty/)).
- [`desktop/`](desktop/) – desktop-layer configuration, including:
  - [`aux/`](desktop/aux/) – auxiliary utilities (waybar, rofi, swaync, etc.)
  - [`dm/`](desktop/dm/) – display manager (sddm)
  - [`sessions/`](desktop/sessions/) – window manager sessions (hyprland)
  - [`styles/`](desktop/styles/) – fonts and themes

## Flake Inputs
| Input | Description |
|-------|-------------|
| [nixpkgs](https://github.com/nixos/nixpkgs) | NixOS 25.11 packages |
| [home-manager](https://github.com/nix-community/home-manager) | User environment management |
| [nur](https://github.com/nix-community/NUR) | Nix User Repository |
| [nixvim](https://github.com/nix-community/nixvim) | Neovim configuration in Nix |
| [hexecute](https://github.com/ThatOtherAndrew/Hexecute) | Custom utility |

## Credit
Some configurations are based on
[Sly-Harvey/NixOS](https://github.com/Sly-Harvey/NixOS).

## License
This project is licensed under the [MIT License](LICENSE).
