{ lib, config, name, username ? null, hostname ? null, ... }:

let
  lookup = import ../../../_lib/getProfile.nix { inherit lib; };
  hasUser = username != null;
  hasHost = hostname != null;
  profile = if hasUser then
    lookup.getUserProfile config username
  else if hasHost then
    lookup.getHostProfile config hostname
  else
    { };
  desktop = profile.desktop or { };
  aux = desktop.aux or { };
  item = aux.${name} or { };
  enabled = (hasUser || hasHost) && (desktop.enable or false)
    && (item.enable or false);
in cfg:
let
  imports = cfg.imports or [ ];
  configWithoutImports = builtins.removeAttrs cfg [ "imports" ];
in {
  inherit imports;
  config = lib.mkIf enabled configWithoutImports;
}
