# NixOS Flake Config

[![Nix Flake CI](https://github.com/Yttehs-HDX/NixOS-flake-config/actions/workflows/ci.yml/badge.svg)](https://github.com/Yttehs-HDX/NixOS-flake-config/actions/workflows/ci.yml)

A reproducible NixOS setup for a personal laptop, bundled with Home Manager modules and host-specific configuration.

## Repository Layout

- `flake.nix` – top-level flake wiring Nixpkgs, Home Manager, NUR, NixVim and other inputs.

- `hosts/` – machine profiles containing hardware configuration and host-specific settings.

- `system/` – NixOS system-level modules including global settings, software (bluetooth, networking, nvidia, etc.), and home-aux configurations.

- `home/` – Home Manager modules for user environment, including global settings and software (git, kitty, neovim, zsh, etc.).

- `desktop/` – desktop environment configuration, including:
  - `aux/` – auxiliary utilities (waybar, rofi, swaync, etc.)
  - `dm/` – display manager (sddm)
  - `sessions/` – window manager sessions (hyprland)
  - `styles/` – fonts and themes

- `users/` – per-user Home Manager entries.

## Getting Started

Switch the entire system:

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

> [!WARNING]
> This is my personal config, which may contain **BUGS**.
>
> It is not a good idea to use my configuration directly. You should refer to it instead of applying it directly.

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
