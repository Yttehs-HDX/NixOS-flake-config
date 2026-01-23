{ lib, pkgs, config, ... }:

let
  lookup = import ../../../../_lib/getStyle.nix { };
  theme = lookup.getTheme config;
  themeName = theme.name or "";
  flavor = theme.flavor or "mocha";
  accent = theme.accent or "lavender";
  catppuccin = "catppuccin-${flavor}-${accent}";
in {
  config = lib.mkIf (themeName == "catppuccin") (let
    catppuccinKvantum = pkgs.catppuccin-kvantum.override {
      variant = flavor;
      inherit accent;
    };
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
