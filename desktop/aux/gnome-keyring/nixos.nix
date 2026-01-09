{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  gnomeKeyring = aux.gnome-keyring or {};
  enabled = (desktop.enable or false) && (gnomeKeyring.enable or false);
in
{
  config = lib.mkIf enabled {
    services.gnome.gnome-keyring.enable = true;
  };
}
