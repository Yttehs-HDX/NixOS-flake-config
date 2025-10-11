{ lib, ... }:

let
  inherit (lib) mkOption types;
in {
  options.userTheme = {
    catppuccinVariant = mkOption {
      type = types.str;
      default = "mocha";
      description = "Catppuccin flavour to apply across themed modules.";
    };

    catppuccinAccent = mkOption {
      type = types.str;
      default = "lavender";
      description = "Catppuccin accent colour to use for themed modules.";
    };

    fontFamily = mkOption {
      type = types.str;
      default = "SF Pro";
      description = "Primary typeface to use for UI elements.";
    };

    fontSize = mkOption {
      type = types.number;
      default = 12;
      description = "Preferred UI font size.";
    };

    cursorSize = mkOption {
      type = types.int;
      default = 24;
      description = "Pointer cursor size for Wayland/GTK environments.";
    };
  };
}

