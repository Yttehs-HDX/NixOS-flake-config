{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  udiskie = aux.udiskie or {};
  enabled = (desktop.enable or false) && (udiskie.enable or false);
in {
  config = lib.mkIf enabled {
    services.udiskie.enable = true;
  };
}
