{ lib, ... }:

{
  options.desktop.style.theme = lib.mkOption {
    type = lib.types.submodule {
      options = {
        name = lib.mkOption {
          type = lib.types.enum [ "catppuccin" ];
          default = "catppuccin";
          description = "Style theme name (Catppuccin-only contract).";
        };

        flavor = lib.mkOption {
          type = lib.types.enum [ "latte" "frappe" "macchiato" "mocha" ];
          default = "mocha";
          description = "Catppuccin flavor to apply across themed modules.";
        };

        accent = lib.mkOption {
          type = lib.types.str;
          default = "lavender";
          description = "Catppuccin accent color to use across themed modules.";
        };
      };
    };
    default = { };
    description = "Theme selection and derived values for style modules.";
  };
}
