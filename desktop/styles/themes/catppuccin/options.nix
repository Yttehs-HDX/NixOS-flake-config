{ lib, config, ... }:

let palettes = import ./inner/palettes.nix { };
in {
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

        palette = lib.mkOption {
          type = lib.types.attrsOf lib.types.str;
          internal = true;
          readOnly = true;
          description =
            "Derived palette values (computed from desktop.style.theme.flavor).";
        };
      };
    };
    default = { };
    description = "Theme selection and derived values for style modules.";
  };

  config = let
    theme = config.desktop.style.theme or { };
    flavor = theme.flavor or "mocha";
    accentName = theme.accent or "lavender";
    palette = palettes.${flavor} or palettes.mocha;
    accent = palette.${accentName} or palette.lavender;
  in {
    desktop.style.theme.palette =
      lib.mkIf ((theme.name or "catppuccin") == "catppuccin") (palette // {
        accent = accent;
        accentName = accentName;
      });
  };
}
