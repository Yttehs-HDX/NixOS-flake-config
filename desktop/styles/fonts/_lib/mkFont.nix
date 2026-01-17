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
