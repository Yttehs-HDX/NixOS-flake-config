{ config, lib, pkgs, ... }:

let
  theme = config.profile.style.theme or { };
  themeName = theme.name or "";
in {
  config = lib.mkIf (themeName == "catppuccin") {
    i18n.inputMethod.fcitx5.addons = with pkgs; [ catppuccin-fcitx5 ];
  };
}
