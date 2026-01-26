# Project Structure
This project has 6 layers.

```plaintext
.
├── desktop     # Desktop layer
├── flake.nix   # Flake layer
├── home        # User layer
├── hosts       # Host profiles
├── system      # System layer
└── users       # User profiles
```

## Composition
Described from top to bottom.

### Flake Layer
The Flake layer is the top-level entry of the configuration tree.
It aggregates and outputs all configurations.

### System Layer
The system layer produces the nixosSystem configuration for a single host.

### User Layer
The user layer produces the Home Manager configuration for a single user.

### Desktop Layer
The desktop layer is used by both system and user layers to generate
all desktop-related configuration.

---
The following two are pure configuration layers.

### Host Profiles
Pure configuration declaring all host profiles.

### User Profiles
Pure configuration declaring all user profiles.

## Dependency Graph
```plaintext
flake  -> system
system -> hosts, users, desktop, home
home   -> users, desktop
desktop-> hosts, users
hosts  -> (leaf)
users  -> (leaf)
```
