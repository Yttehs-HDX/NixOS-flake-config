# Desktop Layer
```plaintext
desktop
├── aux
│   ├── some-package
│   │   ├── home.nix
│   │   ├── inner-home.nix
│   │   ├── inner-nixos.nix
│   │   ├── nixos.nix
│   │   └── themes
│   ├── home.nix
│   ├── nixos.nix
│   └── options.nix
├── dm
│   ├── nixos.nix
│   ├── options.nix
│   └── some-dm
│       ├── inner-nixos.nix
│       ├── nixos.nix
│       └── themes
├── home.nix
├── nixos.nix
├── options-home.nix
├── options-nixos.nix
├── sessions
│   ├── home.nix
│   ├── some-session
│   │   ├── aux
│   │   ├── home.nix
│   │   ├── inner-home
│   │   ├── inner-nixos.nix
│   │   └── nixos.nix
│   ├── nixos.nix
│   └── options.nix
└── styles
    ├── fonts
    │   ├── home.nix
    │   ├── some-font
    │   │   ├── default.nix
    │   │   └── inner-home.nix
    │   ├── options.nix
    │   ├── runtime-options.nix
    │   └── user-fonts
    ├── home-inject.nix
    ├── home.nix
    ├── nixos-inject.nix
    ├── nixos.nix
    ├── options.nix
    ├── runtime-options.nix
    └── themes
        ├── some-theme
        │   ├── default.nix
        │   ├── gtk.nix
        │   ├── inner
        │   │   └── palettes.nix
        │   └── qt.nix
        ├── home.nix
        ├── options.nix
        └── runtime-options.nix
```

> The desktop layer is the most complex layer:
> it includes both user-level and system-level implementations,
> and it needs to handle themes and styles.

## Composition
The desktop layer is split into system and user parts:
the system part is managed by `nixos.nix`, and the user part by `home.nix`.

### dm
The `dm` module maintains the set of available display managers, driven by host profiles.
For sddm, it uses [`mkDisplayManager`](../../desktop/dm/_lib/mkDisplayManager.nix) and
[`getProfile.getHostProfile`](../../_lib/getProfile.nix#L11) to get
`desktop.dm.some-dm` for the current host, then combines that with `desktop.enable`
to decide whether to enable the DM.

### aux
`aux` maintains helper packages for the desktop environment, driven by user profiles.
It uses [`mkAuxPackage`](../../desktop/aux/_lib/mkAuxPackage.nix).
`aux` requires both user and system layers to work together:
- `home` uses [`getProfile.getUserProfile`](../../_lib/getProfile.nix#L4) to read
  the current user's `desktop.aux.some-package` and generate Home Manager config.
- `nixos` uses [`getProfile.getHostIntegratedProfile`](../../_lib/getProfile.nix#L18)
  to read `desktop.aux.some-package` from all users selected on the host, and
  generates nixosSystem config if any user enables it (with both `desktop.enable`
  and `desktop.aux.some-package.enable`).

### sessions
`sessions` maintains available desktop sessions, driven by user profiles.
It uses [`mkSession`](../../desktop/sessions/_lib/mkSession.nix).
Like `aux`, sessions require both user and system layers:
- `home` uses [`getProfile.getUserProfile`](../../_lib/getProfile.nix#L4) to read
  `desktop.sessions.some-session` and generate Home Manager config for a user.
- `nixos` uses [`getProfile.getHostIntegratedProfile`](../../_lib/getProfile.nix#L18)
  to read `desktop.sessions.some-session` from all users selected on the host, and
  generates nixosSystem config if any user enables it (with both `desktop.enable`
  and `desktop.sessions.some-session.enable`).

#### some-session/aux
This `aux` keeps helper packages required by the session and is toggled by `mkSession`.
It directly imports the helper package `home.nix` or `nixos.nix` and bypasses
`mkAuxPackage` checks, enabling config when
`desktop.sessions.some-session.enable` is `true`.

### styles
Since there are two privilege levels (host and user) and a one-to-many relationship,
hosts and users manage their own themes and styles.
For example, the display manager is fully host-driven, and its theme follows the host;
user sessions are independent, so themes follow user choice.

#### fonts
The `fonts` module only applies to the user layer.
It reads `desktop.style.fonts.some-font` from user profiles to control font config
in Home Manager.

##### user-fonts
`user-fonts` controls user-defined fonts by injecting
`desktop.style.fonts.default` and `desktop.style.fonts.mono.default` as defaults.

#### themes
Theme configuration has a special injection flow: palettes are derived from the accent.
Reading config and writing back would cause a **cyclic dependency**,
so style config is exported to runtime `config.profile.style`, and host/user views differ.
`config.profile.style` is injected by
[`nixos-inject.nix`](../../desktop/styles/nixos-inject.nix) or
[`home-inject.nix`](../../desktop/styles/home-inject.nix) from
`profile.hosts.*.desktop.style` or `profile.users.*.desktop.style`.
Theme modules then derive runtime values like `palette` under
`config.profile.style.theme`.

### options.nix
All `options.nix` and `runtime-options.nix` files belong to the Options System.
See [Options System](../special-scope/options-system.md).

### home.nix
The Home Manager side of the desktop layer is a Nix module function provided by `home.nix`.
It is ultimately called by the user layer to generate Home Manager configuration.

### nixos.nix
The nixosSystem side of the desktop layer is a Nix module function provided by `nixos.nix`.
It is ultimately called by the system layer to generate nixosSystem configuration.
