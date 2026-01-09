{ lib, pkgs, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  fcitx5 = aux.fcitx5 or {};
  enabled = (desktop.enable or false) && (fcitx5.enable or false);
in {
  config = lib.mkIf enabled {
    i18n.inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-gtk
          qt6Packages.fcitx5-chinese-addons
          fcitx5-pinyin-zhwiki
          fcitx5-pinyin-moegirl
          fcitx5-mozc
          catppuccin-fcitx5
        ];
      };
    };
  };
}
