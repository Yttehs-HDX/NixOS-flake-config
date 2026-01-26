{ lib, config, hostname, ... }:

let
  lookup = import ../../_lib/getProfile.nix { inherit lib; };
  hostProfile = lookup.getHostProfile config hostname;
  hostStyle = (hostProfile.desktop or { }).style or { };
  derivedFonts = hostStyle.fonts or { };
  derivedTheme = hostStyle.theme or { };
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
