{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  blueman = aux.blueman or {};
  enabled = (desktop.enable or false) && (blueman.enable or false);
in
{
  config = lib.mkIf enabled {
    services.blueman.enable = true;
  };
}
