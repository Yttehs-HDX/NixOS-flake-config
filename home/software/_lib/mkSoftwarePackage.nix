{ lib, config, name }:

let
  username = config.home.username or null;
  userProfile =
    if username != null then config.profile.users.${username} or { } else { };
  home = userProfile.home or { };
  sw = home.software or { };
  item = sw.${name} or { };
  enabled = item.enable or false;
in cfg: { config = lib.mkIf enabled cfg; }
