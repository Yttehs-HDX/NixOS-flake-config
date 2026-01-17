{ config, lib, pkgs, ... }:

let
  mkFont = import ../_lib/mkFont.nix {
    inherit lib config;
    name = "user-fonts";
  };
in mkFont {

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ config.desktop.style.fonts.mono.default ];
      sansSerif = [ config.desktop.style.fonts.default ];
      serif = [ config.desktop.style.fonts.default ];
    };
  };
}
