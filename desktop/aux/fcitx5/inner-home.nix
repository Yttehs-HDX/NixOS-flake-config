{ config, lib, pkgs, ... }:

let
  theme = config.style.theme;
in {
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
      ] ++ lib.optionals (theme.theme == "catppuccin") [
        catppuccin-fcitx5
      ];
    };
  };
}
