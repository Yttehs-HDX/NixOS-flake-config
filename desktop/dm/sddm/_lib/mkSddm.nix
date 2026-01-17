{ lib, config }:

let
  userProfiles = config.profile.users or { };
  anyUserEnabled = lib.any (userProfile:
    let
      desktop = userProfile.desktop or { };
      dm = desktop.dm or { };
      sddm = dm.sddm or { };
    in (desktop.enable or false) && (sddm.enable or false))
    (builtins.attrValues userProfiles);
in mkConfig: lib.mkIf anyUserEnabled (mkConfig { })
