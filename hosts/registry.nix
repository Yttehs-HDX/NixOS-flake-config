let
  mkHost = import ./_lib/mkHostRegistryEntry.nix;
in
builtins.listToAttrs [
  (mkHost { hostname = "laptop"; })
]
