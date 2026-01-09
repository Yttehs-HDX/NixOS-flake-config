{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  udisks2 = aux.udisks2 or {};
  enabled = (desktop.enable or false) && (udisks2.enable or false);
in
{
  config = lib.mkIf enabled {
    services.udisks2.enable = true;
  };
}
