# User Layer
```plaintext
home
├── default.nix
├── global
│   ├── default.nix
│   ├── home-manager.nix
│   └── some-config.nix
├── options.nix
└── software
    ├── some-package
    │   ├── default.nix
    │   └── inner.nix
    ├── options.nix
    └── default.nix
```

## Composition
### software
The `software` submodule maintains Home Manager-level packages.
It uses [`mkSoftwarePackage.nix`](../../home/software/_lib/mkSoftwarePackage.nix)
to read `home.software.some-package` options from user profiles
and decide whether to generate the package configuration for that user.

All package configurations are aggregated by `default.nix` and passed upward.

### global
The `global` submodule maintains common Home Manager configuration
used by every user, such as base Home Manager settings.

---
Below are special shared modules.

#### user.nix
`user.nix` defines basic user attributes inside Home Manager.
It calls [`getProfile.getUserProfile`](../../_lib/getProfile.nix#L4)
to retrieve the user's profile, then reads `user.username`
so Home Manager can set the username and home directory.

---
All configurations in `global` are aggregated by `default.nix` and passed upward.

### options.nix
All `options.nix` files belong to the Options System.
See [Options System](../special-scope/options-system.md).

### default.nix
The `home` layer is essentially a Nix module function, provided by `default.nix`.
It takes `username` (the user name) as a parameter and composes the configuration
in this directory with the user portion of the desktop layer to generate
that user's Home Manager configuration.
