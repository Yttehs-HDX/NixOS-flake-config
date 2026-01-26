# Config Injection
User and host profiles are both accessible by username or hostname,
but modules do not take a single profile directly.
Instead, they access everything through a unified config injection mechanism.

## Flake Layer
At the Flake layer, user and host profile key-value pairs are collected,
merged into a `profiles` variable with `users` and `hosts` prefixes,
then passed into the system layer.

## System Layer
During system initialization, injection has not happened yet, so the current
host profile must be read manually to get key fields like `host.system`.

---
Since nixosSystem and Home Manager configurations are independent,
injection must happen in both layers.

### Injection for nixosSystem
When `lib.nixosSystem` builds `modules`, it writes profiles into `config.profile`.

After that, the [`getProfile`](../../_lib/getProfile.nix) function is available
within the nixosSystem scope.

### Injection for Home Manager
In [`system/global/home-manager`](../../system/global/home-manager.nix),
`getProfile.getHostIntegratedProfile` is used to gather profiles for users
enabled on the current host, collected into a local `profiles` variable,
then injected into `config.profile` via `home-manager.sharedModules`.

After that, the [`getProfile`](../../_lib/getProfile.nix) function is available
within the Home Manager scope.

## Desktop Layer
To handle style differences across users, hosts, and their combinations,
the desktop layer injects the caller's style into runtime `config.profile.style`.

---
Because nixosSystem and Home Manager are independent, this injection also
happens in both layers, triggered when `desktop/home.nix` or `desktop/nixos.nix`
are called.

### Injection for Home Manager
In [`desktop/styles/home-inject.nix`](../../desktop/styles/home-inject.nix),
`getProfile` fetches the current profile's `desktop.style`,
then injects it into `config.profile.style`.

After that, the [`getStyle`](../../_lib/getStyle.nix) function is available
within the Home Manager scope.

### Injection for nixosSystem
Similar to the Home Manager layer,
[`desktop/styles/nixos-inject.nix`](../../desktop/styles/nixos-inject.nix)
uses `getProfile` to get the current profile's `desktop.style`,
then injects it into `config.profile.style`.

After that, the [`getStyle`](../../_lib/getStyle.nix) function is available
within the nixosSystem scope.

## User Layer
The user layer does not inject configuration directly; user profile injection
is handled by the system layer.
