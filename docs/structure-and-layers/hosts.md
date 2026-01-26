# Host Profiles
```plaintext
hosts
├── default.nix
├── registry.nix
└── hostname
    ├── hardware-configuration.nix
    └── profile.nix
```

## Composition
### hostname
Each `hostname` directory contains two independent config files.

#### profile.nix
`profile.nix` is pure host-level configuration with three sub-sections.

##### host
Defines basic host information, such as the hostname.

---
There is a special setting:
- **host.users**: String array listing users to add to this host.

##### system
Defines host-specific configuration such as packages.
Only affects the nixosSystem layer.

##### desktop
Defines host-specific desktop configuration such as fonts, themes, and display manager.
Only affects the nixosSystem layer.

#### hardware-configuration.nix
`hardware-configuration.nix` records host hardware configuration, mainly disk partitions.
This is host-specific and auto-generated from hardware, so large edits are discouraged.

Generate it with:

```bash
sudo nixos-generate-config              # on an installed NixOS system
# or
sudo nixos-generate-config --root /mnt  # during NixOS installation
```

### registry.nix
`registry.nix` maintains the set of relative paths for all hosts.
It uses the helper [`mkHostRegistryEntry`](../../hosts/_lib/mkHostRegistryEntry.nix)
to map hostnames to host profiles and hardware configs,
which can be accessed via the `profile` and `hardwareConfig` keys.

### default.nix
`default.nix` returns the set produced by `registry.nix`.
So `import ./hosts` yields the mapping of hostnames to
`{ profile, hardwareConfig }`.
