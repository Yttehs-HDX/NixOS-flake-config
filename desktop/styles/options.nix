{ lib, config, ... }:

let
  username = config.home.username or null;
  userProfile =
    if username != null then config.profile.users.${username} or { } else { };
  derivedStyle = ((userProfile.desktop or { }).style or { });
  derivedFonts = derivedStyle.fonts or { };
  derivedTheme = derivedStyle.theme or { };
in {
  imports = [ ./themes/options.nix ./fonts/options.nix ];

  config.desktop.style.fonts = lib.mkIf (derivedFonts != { }) {
    default = lib.mkIf (derivedFonts ? default) derivedFonts.default;
    mono = lib.mkIf (derivedFonts ? mono) derivedFonts.mono;
  };

  config.desktop.style.theme = lib.mkIf (derivedTheme != { }) {
    name = lib.mkIf (derivedTheme ? name) derivedTheme.name;
    flavor = lib.mkIf (derivedTheme ? flavor) derivedTheme.flavor;
    accent = lib.mkIf (derivedTheme ? accent) derivedTheme.accent;
  };
}
