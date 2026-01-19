{ config, lib, pkgs, username, ... }:

let
  mkFont = import ../_lib/mkFont.nix {
    inherit lib config username;
    name = "noto-fonts-cjk-serif";
  };
in mkFont {

  home.packages = [ pkgs.noto-fonts-cjk-serif ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Serif CJK JP" "Noto Serif CJK TC" "Noto Serif CJK SC" ];
    };
  };
}
