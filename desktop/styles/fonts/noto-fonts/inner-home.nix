{ pkgs, ... }:

{
  home.packages = [ pkgs.noto-fonts ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
  };
}
