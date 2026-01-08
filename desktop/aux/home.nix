{ ... }:

{
  imports = [
    ./programs/waybar.nix
    ./programs/rofi.nix
    ./services/hyprpolkitagent.nix
    ./services/udiskie.nix
    ./services/cliphist.nix
    ./services/hypridle.nix
    ./services/swww.nix
    ./services/network-manager.nix
    ./services/blueman.nix
    ./services/swaync.nix
    ./services/kdeconnect.nix
    ./i18n/fcitx5.nix
  ];
}
