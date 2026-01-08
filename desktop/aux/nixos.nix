{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  enabled = (desktop.enable or false) && (aux.enable or false);
in {
  config = lib.mkIf enabled {
    services = {
      gnome.gnome-keyring.enable = true;

      pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
        jack.enable = true;
      };

      blueman.enable = true;
      udisks2.enable = true;
    };
  };
}
