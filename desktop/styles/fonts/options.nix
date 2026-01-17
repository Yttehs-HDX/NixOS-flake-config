{ lib, userProfilesAttr, ... }:

{
  options.desktop.style.fonts = lib.mkOption {
    type = lib.types.submodule {
      options = {
        default = lib.mkOption {
          type = lib.types.str;
          default = "DejaVu Sans";
          description = "Primary UI font family.";
        };
        mono = lib.mkOption {
          type = lib.types.submodule {
            options = {
              default = lib.mkOption {
                type = lib.types.str;
                default = "JetBrainsMono Nerd Font";
                description = "Primary monospace font family.";
              };
            };
          };
          default = { };
          description = "Monospace font settings.";
        };
      };
      freeformType = lib.types.attrsOf (lib.types.submodule {
        options = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable a font package by name.";
          };
        };
      });
    };
    default = { };
    description = "Font families for UI and monospace usage.";
  };
}
