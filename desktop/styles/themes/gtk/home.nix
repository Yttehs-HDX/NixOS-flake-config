{ config, lib, pkgs, ... }:

let
  style = config.style;
  theme = style.theme;
  variant = theme.variant;
  accent = theme.accent;
  uiFont = style.font.default;
  fontSize = 12;
  cursorSize = 24;
  catppuccin = "catppuccin-${variant}-${accent}";
  capitalize = value:
    if value == "" then
      value
    else
      let
        first = lib.toUpper (lib.substring 0 1 value);
        rest = lib.substring 1 (lib.stringLength value - 1) value;
      in "${first}${rest}";
  cursorVariant = "${variant}${capitalize accent}";
  cursorName =
    "Catppuccin-${capitalize variant}-${capitalize accent}";
  cursorPackage = lib.getAttr cursorVariant pkgs.catppuccin-cursors;
in {
  config = lib.mkIf (theme.name == "catppuccin") {
    gtk = {
      enable = true;
      gtk2.force = true;
      gtk3.extraConfig = {
        "gtk-application-prefer-dark-theme" = if variant == "latte" then "0" else "1";
      };

      theme = {
        name = "${catppuccin}-compact";
        package = pkgs.catppuccin-gtk.override {
          inherit variant;
          accents = [ accent ];
          size = "compact";
        };
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

      cursorTheme = {
        name = cursorName;
        package = cursorPackage;
        size = cursorSize;
      };

      font = {
        name = uiFont;
        size = fontSize;
      };
    };

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
    };
  };
}
