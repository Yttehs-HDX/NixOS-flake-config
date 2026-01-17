{ config, lib, pkgs, ... }:

let
  username = config.home.username or null;
  userProfile =
    if username != null then config.profile.users.${username} or { } else { };
  desktop = userProfile.desktop or { };
  sessions = desktop.sessions or { };
  hyprland = sessions.hyprland or { };
  enabled = (desktop.enable or false) && (hyprland.enable or false);
in {
  imports = [
    ../aux/home.nix
    ./variables.nix
    (import ./bindings.nix { inherit pkgs; })
    ./xwayland.nix
    ./general.nix
    ./decoration.nix
    ./animations.nix
    ./layerrule.nix
    ./plugins.nix
  ];

  config =
    lib.mkIf enabled { wayland.windowManager.hyprland = { enable = true; }; };
}
