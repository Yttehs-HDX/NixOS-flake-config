# System Layer
```plaintext
system
├── default.nix
├── global
│   ├── default.nix
│   ├── home-manager.nix
│   ├── options.nix
│   ├── users.nix
│   └── some-package.nix
├── home-aux
│   ├── some-package
│   │   ├── default.nix
│   │   └── inner.nix
│   └── default.nix
├── options.nix
└── software
    ├── some-package
    │   ├── default.nix
    │   └── inner.nix
    ├── default.nix
    └── options.nix
```

> The system layer is much more complex than the user layer,
> because it must handle both nixosSystem and Home Manager contexts.

## Composition
### software
The `software` submodule maintains nixosSystem-level packages.
It uses [`mkSystemSoftwareModule.nix`](../../system/software/_lib/mkSystemSoftwareModule.nix)
to read `system.software.some-package` from the host profile
and decide whether to build the configuration for that package on the host.

All package configurations are aggregated by `default.nix` and passed upward.

### global
The `global` submodule maintains nixosSystem-level common configuration
shared across all hosts, such as Nix Flake experimental flags.

---
Below are key shared modules.

#### users.nix
`users.nix` handles user creation at the nixosSystem layer.
It calls [`getProfile.getHostIntegratedProfile`](../../_lib/getProfile.nix#L18)
to get user profiles listed in `host.users` for the current host
and creates system users accordingly.

#### home-manager.nix
`home-manager.nix` configures the Home Manager module at the nixosSystem layer.
It calls [`getProfile.getHostIntegratedProfile`](../../_lib/getProfile.nix#L18)
to gather all user profiles listed in `host.users`,
then generates `home-manager.users` based on that set.

This file also injects profiles into the user layer configuration.
See [Config Injection](../special-scope/config-injection.md).

---
All configurations in `global` are aggregated by `default.nix` and passed upward.

### home-aux
`home-aux` provides system-level support for user-layer helpers.
Some packages cannot function with user permissions only,
so they need system-level services or privileges.

`home-aux` only declares packages.
It calls [`getProfile.getHostIntegratedProfile`](../../_lib/getProfile.nix#L18)
to gather all user profiles on this host,
reads `home.software.some-package` switches from those profiles,
then calls [`mkHomeAuxModule`](../../system/home-aux/_lib/mkHomeAuxModule.nix)
to decide whether any user enabled the package,
finally generating the system-level configuration for that package.

All package configurations are aggregated by `default.nix` and passed upward.

### options.nix
All `options.nix` files belong to the Options System.
See [Options System](../special-scope/options-system.md).

### default.nix
The `system` layer is essentially a Nix module function, provided by `default.nix`.
It takes `hostname` and `profiles` as parameters, where `hostname` is the host name,
and `profiles` is described in [Config Injection](../special-scope/config-injection.md).
The function composes the configuration in this directory with the system portion
of the desktop layer to generate the host's nixosSystem configuration.
