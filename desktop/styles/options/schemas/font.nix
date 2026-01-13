{ lib, ... }:

let
  inherit (lib) mkOption types;
in {
  options.style.font = mkOption {
    type = types.submodule {
      options = {
        default = mkOption {
          type = types.str;
          default = "DejaVu Sans";
          description = "Primary UI font family.";
        };
        mono = mkOption {
          type = types.str;
          default = "JetBrainsMono Nerd Font";
          description = "Primary monospace font family.";
        };
      };
    };
    default = {};
    description = "Font families for UI and monospace usage.";
  };
}
