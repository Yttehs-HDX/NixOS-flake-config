{ lib, config, ... }:

let
  username = config.home.username or null;
  userProfile =
    if username != null then config.profile.users.${username} or { } else { };
  derivedFonts = ((userProfile.desktop or { }).style or { }).fonts or { };
in {
  imports = [ ./themes/options.nix ./fonts/options.nix ];

  config.desktop.style.fonts = lib.mkIf (derivedFonts != { }) {
    default = lib.mkIf (derivedFonts ? default) derivedFonts.default;
    mono = lib.mkIf (derivedFonts ? mono) derivedFonts.mono;
  };
}
