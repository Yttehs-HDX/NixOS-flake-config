{ ... }:

{
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
}
