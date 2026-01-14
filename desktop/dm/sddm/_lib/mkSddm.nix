{ lib, profile }:

let
  desktop = profile.desktop or {};
  dm = desktop.dm or {};
  sddm = dm.sddm or {};
  enabled = (desktop.enable or false) && (sddm.enable or false);
in
mkConfig:
lib.mkIf enabled (mkConfig {
  inherit desktop dm sddm enabled;
})
