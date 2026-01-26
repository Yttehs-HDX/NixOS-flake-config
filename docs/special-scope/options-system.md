# Options System
After profile injection into `config.profile`, options.* must be defined
so configuration takes effect and type constraints are enforced.

For easier management, `options.nix` files live near where they are used
and are aggregated into higher-level `options.nix` files.

## User Layer
- [`home/software/options.nix`](../../home/software/options.nix)

  Defines `home.software.submodule.enable` options in user profiles.
  This file is referenced inside `home/options.nix`.

- [`home/options.nix`](../../home/options.nix)

  Defines `user.{username,description,isSuper}` options in user profiles.
  This file is referenced inside `system/global/options.nix`, effectively reused.

## System Layer
- [`system/global/options.nix`](../../system/global/options.nix)

  Because `home-manager.nix` uses user profile `user` options,
  it simply imports the `home/options.nix` module.
  This file is referenced inside `system/options.nix`.

- [`system/software/options.nix`](../../system/software/options.nix)

  Defines `system.software.submodule.enable` options in host profiles.
  This file is referenced inside `system/options.nix`.

- [`system/options.nix`](../../system/options.nix)

  Defines `host.{hostname,users,system}` options in host profiles.
  This file is ultimately used by
  [`system/default.nix`](../../system/default.nix) in `nixosSystem.modules`.

## Desktop Layer
The desktop layer handles user/host profiles and injected `config.profile.style`.

- [`desktop/options-home.nix`](../../desktop/options-home.nix)

  Defines `desktop.enable` options in user profiles.
  This file is referenced inside `home/options.nix`.

- [`desktop/options-nixos.nix`](../../desktop/options-nixos.nix)

  Same as above, defines `desktop.enable` options in host profiles.
  This file is referenced inside `system/options.nix`.

- [`desktop/aux/options.nix`](../../desktop/aux/options.nix)

  Defines `desktop.aux.submodule.enable` options in user profiles.
  This file is referenced inside `desktop/options-home.nix`.

- [`desktop/dm/options.nix`](../../desktop/dm/options.nix)

  Defines `desktop.dm.submodule.enable` options in host profiles.
  This file is referenced inside `desktop/options-nixos.nix`.

- [`desktop/sessions/options.nix`](../../desktop/sessions/options.nix)

  Defines `desktop.sessions.submodule.enable` options in user profiles.
  This file is referenced inside `desktop/options-home.nix`.

- [`desktop/styles/fonts/options.nix`](../../desktop/styles/fonts/options.nix)

  Defines `desktop.style.fonts.{default,mono.default}` and
  `desktop.style.fonts.submodule.enable` options for user and host profiles.
  This file is referenced inside `desktop/styles/options.nix`.

- [`desktop/styles/themes/options.nix`](../../desktop/styles/themes/options.nix)

  Defines `desktop.style.theme.submodule.{name,flavor,accent}` options
  for user and host profiles.
  This file is referenced inside `desktop/styles/options.nix`.

- [`desktop/styles/options.nix`](../../desktop/styles/options.nix)

  Simply imports `desktop/styles/fonts/options.nix` and
  `desktop/styles/themes/options.nix`.
  This file is referenced inside `desktop/options-home.nix` and
  `desktop/options-nixos.nix`.

---
The desktop layer has a special runtime injection flow that injects user/host
styles into `config.profile.style`.

- [`desktop/styles/fonts/runtime-options.nix`](../../desktop/styles/fonts/runtime-options.nix)

  Defines `profile.style.fonts.{default,mono.default}` and
  `profile.style.fonts.submodule.enable` options.
  This file is referenced inside `desktop/styles/runtime-options.nix`.

- `desktop/styles/themes/some-theme/options.nix`

  Defines `profile.style.theme.submodule.palette`.
  This file is referenced inside `desktop/styles/themes/runtime-options.nix`.

- [`desktop/styles/themes/runtime-options.nix`](../../desktop/styles/themes/runtime-options.nix)

  Defines `profile.style.theme.submodule.{name,flavor,accent}` options.
  This file is referenced inside `desktop/styles/runtime-options.nix`.

- [`desktop/styles/runtime-options.nix`](../../desktop/styles/runtime-options.nix)

  Simply imports `desktop/styles/fonts/runtime-options.nix` and
  `desktop/styles/themes/runtime-options.nix`.
  This file is imported by `desktop/styles/{home.nix,nixos.nix}` and
  ultimately aggregated in
  [`desktop/home.nix`](../../desktop/home.nix) and
  [`desktop/nixos.nix`](../../desktop/nixos.nix),
  so it is available when those modules are called.
