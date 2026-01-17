{ config, lib, pkgs, ... }:

let
  mkCatppuccinTheme =
    import ../../../styles/themes/catppuccin/_lib/mkCatppuccinTheme.nix {
      inherit lib config;
    };
in {
  config = mkCatppuccinTheme
    (_: { i18n.inputMethod.fcitx5.addons = with pkgs; [ catppuccin-fcitx5 ]; });
}
