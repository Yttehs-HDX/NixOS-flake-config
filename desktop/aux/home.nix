{ ... }:

{
  imports = [
    ./waybar/home.nix
    ./rofi/home.nix
    ./hyprpolkitagent/home.nix
    ./udisks2/home.nix
    ./cliphist/home.nix
    ./hypridle/home.nix
    ./swww/home.nix
    ./network-manager/home.nix
    ./blueman/home.nix
    ./swaync/home.nix
    ./fcitx5/home.nix

    ./playerctl
    ./brightnessctl
    ./pulseaudio
    ./swaylock-effects
    ./libnotify
    ./wl-clipboard
    ./grimblast
    ./swappy
    ./hyprpicker
    ./rofimoji
    ./vlc
    ./seahorse

  ];
}
