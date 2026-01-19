{ lib, config, name, hostname }:

let
  lookup = import ../../../_lib/getProfile.nix { inherit lib; };
  hostProfile = lookup.getHostProfile config hostname;
  systemProfile = hostProfile.system or { };
  sw = systemProfile.software or { };
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
