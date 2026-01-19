{ lib, config, hostname ? null }:

let
  lookup = import ../../../../_lib/getProfile.nix { inherit lib; };
  hostProfile =
    if hostname != null then lookup.getHostProfile config hostname else { };
  desktop = hostProfile.desktop or { };
  dm = desktop.dm or { };
  sddm = dm.sddm or { };
  enabled = (hostname != null) && (desktop.enable or false)
    && (sddm.enable or false);
in mkConfig: lib.mkIf enabled (mkConfig { })
