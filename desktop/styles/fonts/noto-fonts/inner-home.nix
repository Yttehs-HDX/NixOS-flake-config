{ config, lib, pkgs, username, ... }:

let
  mkFont = import ../_lib/mkFont.nix {
    inherit lib config username;
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
