{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  services = aux.services or {};
  hyprpolkitagent = services.hyprpolkitagent or {};
  enabled = (desktop.enable or false) && (hyprpolkitagent.enable or false);
in {
  config = lib.mkIf enabled {
    services.hyprpolkitagent.enable = true;
  };
}
