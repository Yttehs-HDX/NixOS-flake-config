{ ... }:

let
  mkHostRegistryEntry = import ./_lib/mkHostRegistryEntry.nix;
  paths = [ ./Shetty-Laptop ];
in builtins.listToAttrs (map (path:
  let entry = mkHostRegistryEntry { inherit path; };
  in {
    inherit (entry) name;
    value = {
      inherit (entry) profile hardwareConfig;
    };
  }) paths)
