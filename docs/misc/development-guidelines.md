# Development Guidelines
This document only describes "how to add" things. For details, refer to the documentation of each layer.

## Add a New User
1. Create `users/<name>/profile.nix` and define a profile with at least `user.username`,
   then add `desktop` and `home.software` as needed.
2. Append `./<name>` to the `names` list in `users/registry.nix`.
3. Add the username to `host.users` in the target host's `hosts/<host>/profile.nix`.
4. If a desktop layer is needed, ensure `desktop.enable = true` in the user profile
   and enable the required `desktop.sessions` / `desktop.aux` modules.

## Add a New Host
1. Create `hosts/<hostname>` containing `profile.nix` and `hardware-configuration.nix`.
2. In `profile.nix`, set `host.hostname` (must match the directory name), `host.system`,
   and `host.users`, then configure `desktop` and `system.software` as needed.
3. Append `./<hostname>` to the `paths` list in `hosts/registry.nix`.
4. Flake will auto-discover new hosts; no changes to `flake.nix` are required.

## Define a New Theme
1. Add a theme module under `desktop/styles/themes/<name>`,
   following the `catppuccin` structure (`gtk.nix` / `qt.nix` / `options.nix` / `home.nix`).
2. Import the new theme module in `desktop/styles/themes/home.nix`.
3. Add the theme name to the `name` enum in `desktop/styles/themes/options.nix` and
   `desktop/styles/themes/runtime-options.nix`.
4. If desktop component themes are needed (SDDM/Waybar/Rofi, etc.), add and import them
   under the corresponding module's `themes/` directory.
5. Set `desktop.style.theme.name` to the new theme name in user or host profiles.

## Define a New Package
1. Decide the layer first:
   - User layer: `home/software/<name>` (Home Manager)
   - System layer: `system/software/<name>` (nixos)
   - Desktop helper: `desktop/aux/<name>` (supports home/nixos as needed)
2. Follow existing packages and use `mkSoftware` / `mkSystemSoftware` / `mkAux` to generate modules.
3. Add the new directory to the corresponding aggregator:
   `home/software/default.nix`, `system/software/default.nix`,
   `desktop/aux/home.nix`, or `desktop/aux/nixos.nix`.
4. Enable in profiles via:
   `home.software.<name>.enable = true` /
   `system.software.<name>.enable = true` /
   `desktop.aux.<name>.enable = true`.
