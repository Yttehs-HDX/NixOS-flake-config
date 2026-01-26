# Project Origin

## Background
I need to maintain my NixOS and Home Manager environment long-term, potentially across multiple devices and users.
To avoid scattered, duplicated, and hard-to-reuse configuration, the repository is organized as a Flake with a clear layer split.

## Motivation
- Reproducible: Quickly restore the environment after reinstalling or moving to a new machine.
- Portable: Reuse the same configuration across different hardware and users.
- Maintainable: Separate system, user, and desktop layers to reduce coupling.
- Extensible: Enable software and desktop components on demand via profile switches.

## Goals
- Use a unified registry to manage hosts and users, and auto-generate nixosConfigurations.
- Organize code with clear layers, defining responsibilities for system, user, and desktop layers.
- Centralize styles and themes to keep a consistent desktop experience.
- Minimize the change scope when adding hosts, users, or software.

## Non-Goals
- Not a general framework or template library; it only serves current needs.
- Not intended to cover all distributions or desktop environments.
- Not all software is forced into modular form.
- No guarantee of zero-cost adaptation to upstream changes.

## Key Decisions
- Use Flake as the entry point; `flake.nix` only composes profiles and outputs system configs.
- Use a registry + profile pattern for hosts/users to avoid hardcoding at the entry point.
- Introduce a desktop layer to handle shared desktop logic and styles across system and user layers.
- Inject via `config.profile.{users,hosts}` and `config.profile.style` to reduce module coupling.
- Use `enable` flags to control features and packages consistently.
