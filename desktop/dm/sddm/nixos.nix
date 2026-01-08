{ lib, pkgs, profile, ... }:

let
  desktop = profile.desktop or {};
  dm = desktop.dm or {};
  sddm = dm.sddm or {};
  enabled = (desktop.enable or false) && (sddm.enable or false);
in {
  config = lib.mkIf enabled {
    services.displayManager.sddm = let
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

    environment.systemPackages = with pkgs; [
      # Ensure the SDDM theme is available system-wide.
      (catppuccin-sddm.override { flavor = "mocha"; })
    ];
  };
}
