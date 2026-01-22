{ config, lib, pkgs, hostname, ... }:

let
  mkCatppuccinTheme =
    import ../../../styles/themes/catppuccin/_lib/mkCatppuccinTheme.nix {
      inherit lib config;
    };
  mkSddm = import ../_lib/mkSddm.nix { inherit lib config hostname; };
in {
  config = mkSddm (_:
    mkCatppuccinTheme ({ flavor, accent, catppuccin, ... }: {
      services.displayManager.sddm = {
        theme = "${
            pkgs.catppuccin-sddm.override { inherit flavor accent; }
          }/share/sddm/themes/${catppuccin}";
      };

      environment.systemPackages = with pkgs;
        [ (catppuccin-sddm.override { inherit flavor accent; }) ];
    }));
}
