{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  kdeconnect = aux.kdeconnect or {};
  enabled = (desktop.enable or false) && (kdeconnect.enable or false);
in {
  config = lib.mkIf enabled {
    services.kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
}
