{ lib, pkgs, profile, ... }:

let
  desktop = profile.desktop or {};
  dm = desktop.dm or {};
  sddm = dm.sddm or {};
  style = profile.style or {};
  themeProfile = sddm.theme or style.theme or {};
  flavor = themeProfile.variant or "mocha";
  accent = themeProfile.accent or "lavender";
  enabled = (desktop.enable or false) && (sddm.enable or false);
in {
  config = lib.mkIf enabled {
    services.displayManager.sddm = {
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

    environment.systemPackages = with pkgs; [
      (catppuccin-sddm.override { inherit flavor accent; })
    ];
  };
}
