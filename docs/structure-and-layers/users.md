# User Profiles
```plaintext
users
├── default.nix
├── registry.nix
└── username
    └── profile.nix
```

## Composition
### username/profile.nix
`profile.nix` is pure user-level configuration with three sub-sections.

#### user
Defines basic user information, such as username.

#### home
Defines user-specific configuration, such as packages.
Mostly involves the Home Manager layer, with minor nixosSystem involvement.

#### desktop
Defines user-specific desktop configuration, such as fonts, themes, and sessions.
Involves both Home Manager and nixosSystem layers.

### registry.nix
`registry.nix` maintains the set of relative paths for all users.
It uses the helper [`mkUserRegistryEntry`](../../users/_lib/mkUserRegistryEntry.nix)
to map usernames to user profiles.

### default.nix
`default.nix` returns the set produced by `registry.nix`.
So `import ./users` yields the mapping of usernames to profiles.
