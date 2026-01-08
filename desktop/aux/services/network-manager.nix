{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  services = aux.services or {};
  networkManager = services.network-manager or {};
  enabled = (desktop.enable or false) && (networkManager.enable or false);
in {
  config = lib.mkIf enabled {
    services.network-manager-applet.enable = true;
  };
}
