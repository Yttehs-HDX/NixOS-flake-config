{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  services = aux.services or {};
  cliphist = services.cliphist or {};
  enabled = (desktop.enable or false) && (cliphist.enable or false);
in {
  config = lib.mkIf enabled {
    services.cliphist.enable = true;
  };
}
