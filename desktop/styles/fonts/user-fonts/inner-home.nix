{ config, lib, pkgs, username, ... }:

let
  mkFont = import ../_lib/mkFont.nix {
    inherit lib config username;
    name = "user-fonts";
  };
  lookup = import ../../../../_lib/getStyle.nix { };
  fonts = (lookup.getStyle config).fonts or { };
  fontDefault = fonts.default or "DejaVu Sans";
  monoDefault = (fonts.mono or { }).default or "JetBrainsMono Nerd Font";
in mkFont {

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ monoDefault ];
      sansSerif = [ fontDefault ];
      serif = [ fontDefault ];
    };
  };
}
