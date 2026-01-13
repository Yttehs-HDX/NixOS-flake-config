{ pkgs, ... }:

{
  home.packages = [ pkgs.noto-fonts-emoji-blob-bin ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "Noto Emoji Blob" ];
    };
  };
}
