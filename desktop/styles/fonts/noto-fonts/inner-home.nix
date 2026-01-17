{ config, lib, pkgs, ... }:

let
  mkFont = import ../_lib/mkFont.nix {
    inherit lib config;
    name = "noto-fonts";
  };
in mkFont {

  home.packages = [ pkgs.noto-fonts ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
  };
}
