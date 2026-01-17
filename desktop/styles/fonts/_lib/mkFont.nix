# mkFont: Creates a module that conditionally applies font config based on user profiles
# Usage in inner module:
#   { config, lib, pkgs, ... }:
#   let mkFont = import ../_lib/mkFont.nix { inherit lib config; name = "xxx"; };
#   in mkFont { fonts.packages = [ pkgs.xxx ]; }
{ lib, config, name ? null }:

let
  userProfiles = config.profile.users or { };
  anyUserEnabled = lib.any (userProfile:
    let
      desktop = userProfile.desktop or { };
      style = desktop.style or { };
      fonts = style.fonts or { };
      fontItem = if name == null then { } else (fonts.${name} or { });
    in (desktop.enable or false)
    && (name == null || (fontItem.enable or false)))
    (builtins.attrValues userProfiles);
in cfg: { config = lib.mkIf anyUserEnabled cfg; }
