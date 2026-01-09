{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  hyprpolkitagent = aux.hyprpolkitagent or {};
  enabled = (desktop.enable or false) && (hyprpolkitagent.enable or false);
in {
  config = lib.mkIf enabled {
    services.hyprpolkitagent.enable = true;
  };
}
