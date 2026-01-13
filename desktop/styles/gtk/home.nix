{ config, lib, pkgs, ... }:

let
  style = config.style;
  theme = style.theme;
  variant = theme.variant;
  accent = theme.accent;
  uiFont = style.font;
  fontSize = 12;
  cursorSize = 24;
  catppuccin = "catppuccin-${variant}-${accent}";
in {
  config = lib.mkIf (theme.name == "catppuccin") {
    gtk = {
      enable = true;
      gtk2.force = true;
      gtk3.extraConfig = { "gtk-application-prefer-dark-theme" = "1"; };

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
        name = "Catppuccin-Mocha-Lavender";
        package = pkgs.catppuccin-cursors.mochaLavender;
        # TODO: switch when other Catppuccin cursor variants are needed.
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
