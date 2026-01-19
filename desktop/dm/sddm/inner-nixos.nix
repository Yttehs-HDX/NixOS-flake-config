{ config, lib, pkgs, hostname, ... }:

let mkSddm = import ./_lib/mkSddm.nix { inherit lib config hostname; };
in {
  imports = [ ./themes/catppuccin.nix ];

  config = mkSddm (_: {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        kdePackages.qtvirtualkeyboard
      ];
    };
  });
}
