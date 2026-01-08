{ ... }:

{
  imports = [
    ../../modules/home-manager/programs/waybar.nix
    ../../modules/home-manager/programs/rofi.nix
    ../../modules/home-manager/services/hyprpolkitagent.nix
    ../../modules/home-manager/services/udiskie.nix
    ../../modules/home-manager/services/cliphist.nix
    ../../modules/home-manager/services/hypridle.nix
    ../../modules/home-manager/services/swww.nix
    ../../modules/home-manager/services/network-manager.nix
    ../../modules/home-manager/services/blueman.nix
    ../../modules/home-manager/services/swaync.nix
    ../../modules/home-manager/services/kdeconnect.nix
    ../../modules/home-manager/i18n/fcitx5.nix
  ];
}
