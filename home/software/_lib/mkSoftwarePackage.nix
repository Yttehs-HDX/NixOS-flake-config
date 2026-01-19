{ lib, config, name, username }:

let
  lookup = import ../../../_lib/getProfile.nix { inherit lib; };
  userProfile = lookup.getUserProfile config username;
  home = userProfile.home or { };
  sw = home.software or { };
  item = sw.${name} or { };
  enabled = item.enable or false;
in cfg:
let
  imports = cfg.imports or [ ];
  configWithoutImports = builtins.removeAttrs cfg [ "imports" ];
in {
  inherit imports;
  config = lib.mkIf enabled configWithoutImports;
}
