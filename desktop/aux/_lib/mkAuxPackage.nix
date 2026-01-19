{ lib, config, name, username ? null, hostname ? null, ... }:

let
  lookup = import ../../../_lib/getProfile.nix { inherit lib; };
  hasUser = username != null;
  hasHost = hostname != null;

  userProfile = if hasUser then lookup.getUserProfile config username else null;
  integrated =
    if hasHost then lookup.getHostIntegratedProfile config hostname else null;
  userProfiles = if hasHost then integrated.users else { };

  userEnabled = if hasUser then
    let
      desktop = userProfile.desktop or { };
      aux = desktop.aux or { };
      item = aux.${name} or { };
    in (desktop.enable or false) && (item.enable or false)
  else
    false;

  anyUserEnabled = if hasHost then
    lib.any (profile:
      let
        desktop = profile.desktop or { };
        aux = desktop.aux or { };
        item = aux.${name} or { };
      in (desktop.enable or false) && (item.enable or false))
    (builtins.attrValues userProfiles)
  else
    false;

  enabled =
    if hasUser then userEnabled else if hasHost then anyUserEnabled else false;
in cfg:
let
  imports = cfg.imports or [ ];
  configWithoutImports = builtins.removeAttrs cfg [ "imports" ];
in {
  inherit imports;
  config = lib.mkIf enabled configWithoutImports;
}
