{ pkgs, ... }:

{
  home.packages = [ pkgs.noto-fonts-cjk-serif ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Serif CJK JP" "Noto Serif CJK TC" "Noto Serif CJK SC" ];
    };
  };
}
