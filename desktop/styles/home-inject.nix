{ lib, config, username, ... }:

let
  lookup = import ../../_lib/getProfile.nix { inherit lib; };
  userProfile = lookup.getUserProfile config username;
  derivedStyle = (userProfile.desktop or { }).style or { };
  derivedFonts = derivedStyle.fonts or { };
  derivedTheme = derivedStyle.theme or { };
in {
  config.profile.style.fonts = lib.mkIf (derivedFonts != { }) {
    default = lib.mkIf (derivedFonts ? default) derivedFonts.default;
    mono = lib.mkIf (derivedFonts ? mono) derivedFonts.mono;
  };

  config.profile.style.theme = lib.mkIf (derivedTheme != { }) {
    name = lib.mkIf (derivedTheme ? name) derivedTheme.name;
    flavor = lib.mkIf (derivedTheme ? flavor) derivedTheme.flavor;
    accent = lib.mkIf (derivedTheme ? accent) derivedTheme.accent;
  };
}
