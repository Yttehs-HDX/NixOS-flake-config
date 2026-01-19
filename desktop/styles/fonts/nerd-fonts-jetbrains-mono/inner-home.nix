{ config, lib, pkgs, username, ... }:

let
  mkFont = import ../_lib/mkFont.nix {
    inherit lib config username;
    name = "nerd-fonts-jetbrains-mono";
  };
in mkFont {

  home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = { monospace = [ "JetBrainsMono Nerd Font" ]; };
  };
}
