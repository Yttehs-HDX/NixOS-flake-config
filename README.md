# NixOS Flake Config

[![Nix Flake CI](https://github.com/Yttehs-HDX/NixOS-flake-config/actions/workflows/ci.yml/badge.svg)](https://github.com/Yttehs-HDX/NixOS-flake-config/actions/workflows/ci.yml)

A reproducible NixOS setup for a personal laptop, bundled with Home Manager modules and host-specific configuration.

## Getting Started

Switch the entire system:

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

> [!WARNING]
> This is my personal config, which may contain **BUGS**.
>
> It is not a good idea to use my configuration directly. You should refer to it instead of applying it directly.

## Key Features

- **Profile-based Configuration** – Define different users and hosts via profiles, each with its own isolated environment and settings.

- **Environment Isolation** – Each host and user configuration is independent, preventing conflicts between different machines or accounts.

- **Composable Modules** – Mix and match system, home, and desktop modules to build the exact environment you need.

- **Reusable Logic** – Common configurations are abstracted into reusable modules under `_lib/` directories, reducing duplication.

- **Declarative Syntax** – All configurations are defined declaratively in Nix, making the system state reproducible and version-controlled.

## Repository Layout

- [`flake.nix`](flake.nix) – top-level flake wiring Nixpkgs, Home Manager, NUR, NixVim and other inputs.

- [`hosts/`](hosts/) – machine profiles containing hardware configuration and host-specific settings (e.g., [`Shetty-Laptop/`](hosts/Shetty-Laptop/)).

- [`system/`](system/) – NixOS system-level modules including global settings, software (bluetooth, networking, nvidia, etc.), and home-aux configurations.

- [`home/`](home/) – Home Manager modules for user environment, including global settings and software (git, kitty, neovim, zsh, etc.).

- [`users/`](users/) – per-user Home Manager entries (e.g., [`shetty/`](users/shetty/)).

- [`desktop/`](desktop/) – desktop environment configuration, including:
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

Some configurations are referenced from [Sly-Harvey/NixOS](https://github.com/Sly-Harvey/NixOS).

## License

This project is licensed under the [MIT License](LICENSE).
