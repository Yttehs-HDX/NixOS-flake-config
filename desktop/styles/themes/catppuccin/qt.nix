{ lib, pkgs, config, ... }:

let
  mkCatppuccinTheme =
    import ./_lib/mkCatppuccinTheme.nix { inherit lib config; };
in {
  config = mkCatppuccinTheme ({ flavor, accent, catppuccin, ... }:
    let
      catppuccinKvantum =
        pkgs.catppuccin-kvantum.override { variant = flavor; inherit accent; };
    in {
      qt = {
        enable = true;
        platformTheme.name = "gtk";
        style.name = "kvantum";
      };

      xdg.configFile = {
        "Kvantum/${catppuccin}".source =
          "${catppuccinKvantum}/share/Kvantum/${catppuccin}";
        "Kvantum/kvantum.kvconfig".source =
          (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
            General.theme = catppuccin;
          };
      };
    });
}
