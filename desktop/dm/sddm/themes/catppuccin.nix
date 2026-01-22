{ config, lib, pkgs, ... }:

let
  theme = config.profile.style.theme or { };
  themeName = theme.name or "";
  flavor = theme.flavor or "mocha";
  accent = theme.accent or "lavender";
  catppuccin = "catppuccin-${flavor}-${accent}";
in {
  config = lib.mkIf (themeName == "catppuccin") {
    services.displayManager.sddm = {
      theme = "${
          pkgs.catppuccin-sddm.override { inherit flavor accent; }
        }/share/sddm/themes/${catppuccin}";
    };

    environment.systemPackages = with pkgs;
      [ (catppuccin-sddm.override { inherit flavor accent; }) ];
  };
}
