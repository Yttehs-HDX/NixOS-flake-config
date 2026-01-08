{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  sessions = desktop.sessions or {};
  hypr = sessions.hyprland or {};
  enabled = (desktop.enable or false) && (hypr.enable or false);
in {
  config = lib.mkIf enabled {
    programs.hyprland.enable = true;
  };
}
