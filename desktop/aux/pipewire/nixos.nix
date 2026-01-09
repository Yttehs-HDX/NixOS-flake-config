{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  aux = desktop.aux or {};
  pipewire = aux.pipewire or {};
  enabled = (desktop.enable or false) && (pipewire.enable or false);
in
{
  config = lib.mkIf enabled {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
