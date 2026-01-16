let
  mkUser = import ./_lib/mkUserRegistryEntry.nix;
in
builtins.listToAttrs [
  (mkUser { username = "shetty"; })
]
