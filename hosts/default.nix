{ name }:

let registry = import ./registry.nix { };
in registry.${name} or (throw "Host ${name} not found")
