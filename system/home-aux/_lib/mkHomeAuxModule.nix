{ lib, config, name, hostname }:

let
  lookup = import ../../../_lib/getProfile.nix { inherit lib; };
  integrated = lookup.getHostIntegratedProfile config hostname;
  userProfiles = integrated.users;
  anyUserEnabled = lib.any (userProfile:
    let
      home = userProfile.home or { };
      sw = home.software or { };
      item = sw.${name} or { };
    in item.enable or false) (builtins.attrValues userProfiles);
in cfg:
let configBody = if lib.isFunction cfg then cfg integrated else cfg;
in { config = lib.mkIf anyUserEnabled configBody; }
