{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  services = aux.services or {};
  blueman = services.blueman or {};
  enabled = (desktop.enable or false) && (blueman.enable or false);
in {
  config = lib.mkIf enabled {
    services.blueman-applet.enable = true;
  };
}
