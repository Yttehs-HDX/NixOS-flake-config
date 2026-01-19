{ lib, config, username ? null, name ? null }:

let
  lookup = import ../../../../_lib/getProfile.nix { inherit lib; };
  hasUser = username != null;
  userProfile =
    if hasUser then lookup.getUserProfile config username else { };
  desktop = userProfile.desktop or { };
  style = desktop.style or { };
  fonts = style.fonts or { };
  fontItem = if name == null then { } else (fonts.${name} or { });
  enabled = hasUser && (desktop.enable or false)
    && (name == null || (fontItem.enable or false));
in cfg: { config = lib.mkIf enabled cfg; }
