{ config, lib, pkgs, username, ... }:

let
  mkFont = import ../_lib/mkFont.nix {
    inherit lib config username;
    name = "noto-fonts-emoji-blob-bin";
  };
in mkFont {

  home.packages = [ pkgs.noto-fonts-emoji-blob-bin ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = { emoji = [ "Noto Emoji Blob" ]; };
  };
}
