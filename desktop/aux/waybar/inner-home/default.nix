{ ... }:

{
  imports = [
    ./base.nix
    ./hyprland.nix
    ./cava.nix
    ./misc.nix
    ./monitor.nix
    ./connection.nix
    ./menu.nix
    ./style.nix
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
}
