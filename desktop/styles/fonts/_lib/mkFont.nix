{ lib, profile, inner, name ? null }:

let
  desktop = profile.desktop or { };
  style = desktop.style or { };
  fonts = style.fonts or { };
  fontItem = if name == null then { } else (fonts.${name} or { });
  enabled = (desktop.enable or false)
    && (name == null || (fontItem.enable or false));
in { imports = lib.optionals enabled [ inner ]; }
