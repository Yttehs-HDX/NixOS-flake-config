{ config, lib, pkgs, ... }:

let
  mkCatppuccinTheme =
    import ../../../styles/themes/catppuccin/_lib/mkCatppuccinTheme.nix {
      inherit lib config;
    };
in {
  config = mkCatppuccinTheme ({ flavor, accent, catppuccin, ... }: {
    services.displayManager.sddm = {
      theme = "${
          pkgs.catppuccin-sddm.override { inherit flavor accent; }
        }/share/sddm/themes/${catppuccin}";
    };

    environment.systemPackages = with pkgs;
      [ (catppuccin-sddm.override { inherit flavor accent; }) ];
  });
}
