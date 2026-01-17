{ lib, config, name }:

let
  userProfiles = config.profile.users or { };
  anyUserEnabled = lib.any (userProfile:
    let
      home = userProfile.home or { };
      sw = home.software or { };
      item = sw.${name} or { };
    in item.enable or false) (builtins.attrValues userProfiles);
in cfg: { config = lib.mkIf anyUserEnabled cfg; }
