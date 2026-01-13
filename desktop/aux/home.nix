{ ... }:

{
  imports = [
    ./waybar/home.nix
    ./rofi/home.nix
    ./hyprpolkitagent/home.nix
    ./udiskie/home.nix
    ./cliphist/home.nix
    ./hypridle/home.nix
    ./swww/home.nix
    ./network-manager/home.nix
    ./blueman/home.nix
    ./swaync/home.nix
    ./kdeconnect/home.nix
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
