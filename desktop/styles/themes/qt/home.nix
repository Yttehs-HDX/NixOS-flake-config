{ lib, pkgs, config, ... }:

let
  style = config.style;
  theme = style.theme;
  variant = theme.variant;
  accent = theme.accent;
  catppuccin = "catppuccin-${variant}-${accent}";
  catppuccinKvantum =
    pkgs.catppuccin-kvantum.override { inherit variant accent; };
in {
  config = lib.mkIf (theme.name == "catppuccin") {
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
  };
}
