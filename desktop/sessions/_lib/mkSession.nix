{ lib, config, name, username ? null, hostname ? null }:

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
  sessions = desktop.sessions or { };
  item = sessions.${name} or { };
  enabled = (hasUser || hasHost) && (desktop.enable or false)
    && (item.enable or false);
in cfg:
let
  hasImports = cfg ? imports;
  imports = cfg.imports or [ ];
  configWithoutImports = builtins.removeAttrs cfg [ "imports" ];
in if hasImports then {
  inherit imports;
  config = lib.mkIf enabled configWithoutImports;
} else {
  config = lib.mkIf enabled cfg;
}
