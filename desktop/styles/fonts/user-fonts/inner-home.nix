{ config, lib, pkgs, username, ... }:

let
  mkFont = import ../_lib/mkFont.nix {
    inherit lib config username;
    name = "user-fonts";
  };
in mkFont {

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ config.profile.style.fonts.mono.default ];
      sansSerif = [ config.profile.style.fonts.default ];
      serif = [ config.profile.style.fonts.default ];
    };
  };
}
