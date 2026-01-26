{ ... }:

let
  getStyle = config: config.profile.style or { };
  getTheme = config: (getStyle config).theme or { };
  getFonts = config: (getStyle config).fonts or { };
in { inherit getStyle getTheme getFonts; }
