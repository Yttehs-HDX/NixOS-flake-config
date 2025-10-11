{ config, pkgs, ... }:

let
  variant = config.userTheme.catppuccinVariant;
  accent = config.userTheme.catppuccinAccent;
  fontFamily = config.userTheme.fontFamily;
  fontSize = config.userTheme.fontSize;
  cursorSize = config.userTheme.cursorSize;
  catppuccin = "catppuccin-${variant}-${accent}";
in {
  gtk = {
    enable = true;
    gtk2.force = true;
    gtk3.extraConfig = {
      "gtk-application-prefer-dark-theme" = "1";
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
      name = "Catppuccin-Mocha-Lavender";
      package = pkgs.catppuccin-cursors.mochaLavender;
      size = cursorSize;
    };

    font = {
      name = fontFamily;
      size = fontSize;
    };
  };
}
