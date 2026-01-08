{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  services = aux.services or {};
  swww = services.swww or {};
  enabled = (desktop.enable or false) && (swww.enable or false);
in {
  config = lib.mkIf enabled {
    services.swww.enable = true;
  };
}
