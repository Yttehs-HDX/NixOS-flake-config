# NixOS Flake Config

[![Nix Flake CI](https://github.com/Yttehs-HDX/NixOS-flake-config/actions/workflows/ci.yml/badge.svg)](https://github.com/Yttehs-HDX/NixOS-flake-config/actions/workflows/ci.yml)

A reproducible NixOS setup for a personal laptop, bundled with Home Manager modules and host-specific configuration.

## Repository Layout

- `flake.nix` – top-level flake wiring Nixpkgs and Home Manager inputs.

- `hosts/` – machine profiles; `laptop/` contains the hardware and system modules for the main device.

- `modules/` – reusable NixOS and Home Manager modules grouped by domain (core system, services, programs, theming, etc.).

- `users/` – per-user Home Manager entries; `shetty/` exposes the primary user environment.

## Getting Started

- Switch the entire system:

    _Attention: This is my personal config, which may contain **BUGS**._

    _It is not a good idea to use my configuration directly. You should refer to it instead of applying it directly._

   ```bash
   sudo nixos-rebuild switch --flake .#laptop
   ```

## Special Thanks

- [Sly-Harvey/NixOS](https://github.com/Sly-Harvey/NixOS)

## License

[MIT](LICENSE)
