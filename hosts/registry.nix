{ ... }:

let
  mkHost = import ./_lib/mkHostRegistryEntry.nix;
  names = [ "Shetty-Laptop" ];
in builtins.listToAttrs (map (name: mkHost { inherit name; }) names)
