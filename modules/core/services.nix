{ config, lib, pkgs, ... }:

{
  services = {
    displayManager.sddm = let
      flavor = "mocha";
      accent = "lavender";
    in {
      enable = true;
      wayland.enable = true;
      theme = "${
          pkgs.catppuccin-sddm.override { inherit flavor accent; }
        }/share/sddm/themes/catppuccin-${flavor}-${accent}";
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        kdePackages.qtvirtualkeyboard
      ];
    };

    gnome.gnome-keyring.enable = true;
    asusd.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };

    blueman.enable = true;
    udisks2.enable = true;
    tlp.enable = true;
  };
}

