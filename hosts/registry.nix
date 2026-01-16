{ }:

let
  mkHost = import ./_lib/mkHostRegistryEntry.nix;
  hostnames = [
    "laptop"
  ];
in
builtins.listToAttrs (map (hostname: mkHost { inherit hostname; }) hostnames)
