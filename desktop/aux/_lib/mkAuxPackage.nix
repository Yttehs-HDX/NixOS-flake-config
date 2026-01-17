{ lib, config, name }:

let
  userProfiles = config.profile.users or { };
  anyUserEnabled = lib.any (userProfile:
    let
      desktop = userProfile.desktop or { };
      aux = desktop.aux or { };
      item = aux.${name} or { };
    in (desktop.enable or false) && (item.enable or false))
    (builtins.attrValues userProfiles);
in cfg: { config = lib.mkIf anyUserEnabled cfg; }
