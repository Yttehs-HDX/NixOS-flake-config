{ config, lib, pkgs, username, ... }:

let
  mkFont = import ../_lib/mkFont.nix {
    inherit lib config username;
    name = "noto-fonts-cjk-sans";
  };
in mkFont {

  home.packages = [ pkgs.noto-fonts-cjk-sans ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [
        "Noto Sans Mono CJK JP"
        "Noto Sans Mono CJK TC"
        "Noto Sans Mono CJK SC"
      ];
      sansSerif = [ "Noto Sans CJK JP" "Noto Sans CJK TC" "Noto Sans CJK SC" ];
    };
  };
}
