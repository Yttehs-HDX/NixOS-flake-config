{ ... }:

let
  mkUserRegistryEntry = import ./_lib/mkUserRegistryEntry.nix;
  names = [ ./shetty ];
in builtins.listToAttrs (map (path:
  let entry = mkUserRegistryEntry { inherit path; };
  in {
    inherit (entry) name;
    value = entry.profile;
  }) names)
