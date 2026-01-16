{ ... }:

let
  mkUser = import ./_lib/mkUserRegistryEntry.nix;
  usernames = [
    "shetty"
  ];
in
builtins.listToAttrs (map (username: mkUser { inherit username; }) usernames)
