{ lib, config, name, username ? null, ... }:

let
  userProfiles = config.profile.users or { };
  userProfile =
    if username != null then userProfiles.${username} or { } else { };
  desktop = userProfile.desktop or { };
  aux = desktop.aux or { };
  item = aux.${name} or { };
  enabled = if username != null then
    (desktop.enable or false) && (item.enable or false)
  else
    lib.any (profile:
      let
        desktop = profile.desktop or { };
        aux = desktop.aux or { };
        item = aux.${name} or { };
      in (desktop.enable or false) && (item.enable or false))
    (builtins.attrValues userProfiles);
in cfg:
let
  imports = cfg.imports or [ ];
  configWithoutImports = builtins.removeAttrs cfg [ "imports" ];
in {
  inherit imports;
  config = lib.mkIf enabled configWithoutImports;
}
