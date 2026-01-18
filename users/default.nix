{ name }:

let registry = import ./registry.nix { };
in registry.${name} or (throw "User ${name} not found")
