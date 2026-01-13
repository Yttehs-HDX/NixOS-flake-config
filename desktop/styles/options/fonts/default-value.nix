{ lib, ... }:

{
  options.style.font = lib.mkOption {
    type = lib.types.submodule {
      options = {
        default = lib.mkOption {
          type = lib.types.str;
          default = "DejaVu Sans";
          description = "Primary UI font family.";
        };
        mono = lib.mkOption {
          type = lib.types.str;
          default = "JetBrainsMono Nerd Font";
          description = "Primary monospace font family.";
        };
      };
    };
    default = {};
    description = "Font families for UI and monospace usage.";
  };
}
