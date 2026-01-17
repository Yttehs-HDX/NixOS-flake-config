{ config, lib, ... }:

let
  userProfiles = config.profile.users or { };
  anyUserEnabled = lib.any (userProfile:
    let
      desktop = userProfile.desktop or { };
      sessions = desktop.sessions or { };
      item = sessions.hyprland or { };
    in (desktop.enable or false) && (item.enable or false))
    (builtins.attrValues userProfiles);
in {
  imports = [ ./aux/nixos.nix ];

  config = lib.mkIf anyUserEnabled { programs.hyprland.enable = true; };
}
