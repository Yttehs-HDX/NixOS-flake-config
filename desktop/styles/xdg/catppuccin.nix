{ config, lib, pkgs, profile, ... }:

let
  desktop = profile.desktop or {};
  styles = desktop.styles or {};
  xdg = styles.xdg or {};
  catppuccinStyle = xdg.catppuccin or {};
  enabled = (desktop.enable or false) && (catppuccinStyle.enable or false);
  variant = config.userTheme.catppuccinVariant;
  accent = config.userTheme.catppuccinAccent;
  catppuccin = "catppuccin-${variant}-${accent}";
  catppuccinKvantum =
    pkgs.catppuccin-kvantum.override { inherit variant accent; };
in {
  config = lib.mkIf enabled {
    xdg.configFile = {
      "gtk-4.0/assets" = {
        force = true;
        source =
          "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
      };
      "gtk-4.0/gtk.css" = {
        force = true;
        source =
          "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
      };
      "gtk-4.0/gtk-dark.css" = {
        force = true;
        source =
          "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
      };
      "Kvantum/${catppuccin}".source =
        "${catppuccinKvantum}/share/Kvantum/${catppuccin}";
      "Kvantum/kvantum.kvconfig".source =
        (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
          General.theme = catppuccin;
        };
    };
  };
}
