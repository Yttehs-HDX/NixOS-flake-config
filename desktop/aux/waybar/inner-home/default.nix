{ ... }:

{
  imports = [
    ./base.nix
    ./hyprland.nix
    ./cava.nix
    ./monitor.nix
    ./connection.nix
    ./menu.nix
    ../themes/default.nix
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
}
