{ config, lib, pkgs, profile, ... }:

let
  mkSddm = import ./_lib/mkSddm.nix { inherit lib profile; };
in {
  imports = [
    ./themes/catppuccin.nix
  ];

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
