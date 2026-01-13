{ lib, pkgs, config, ... }:

let
  style = config.style;
  theme = style.theme;
  themeName = theme.theme;
  flavor = theme.flavor;
  accent = theme.accent;
  catppuccin = "catppuccin-${flavor}-${accent}";
  catppuccinKvantum =
    pkgs.catppuccin-kvantum.override { variant = flavor; inherit accent; };
in {
  config = lib.mkIf (themeName == "catppuccin") {
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
