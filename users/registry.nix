{ ... }:

let
  mkUser = import ./_lib/mkUserRegistryEntry.nix;
  names = [
    "shetty"
  ];
in
builtins.listToAttrs (map (name: mkUser { inherit name; }) names)
