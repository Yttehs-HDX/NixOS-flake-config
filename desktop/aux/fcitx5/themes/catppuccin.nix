{ config, lib, pkgs, ... }:

let
  lookup = import ../../../../_lib/getStyle.nix { };
  theme = lookup.getTheme config;
  themeName = theme.name or "";
in {
  config = lib.mkIf (themeName == "catppuccin") {
    i18n.inputMethod.fcitx5.addons = with pkgs; [ catppuccin-fcitx5 ];
  };
}
