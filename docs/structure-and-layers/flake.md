# Flake Layer
```plaintext
.
└── flake.nix
```

## Composition
### flake.nix
`flake.nix` calls the system layer and generates configurations for all hosts.

---
One key point:

The [`system`](../../system/default.nix) function needs a special parameter `profiles`,
which represents the combined set of user and host profiles.
See [Config Injection](../special-scope/config-injection.md).
