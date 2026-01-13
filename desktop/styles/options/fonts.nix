{ lib, profile, ... }:

let
  styleProfile = profile.style or {};
  fontProfile = styleProfile.font or {};
in {
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

  config = lib.mkMerge [
    (lib.mkIf (fontProfile ? default) {
      style.font.default = lib.mkDefault fontProfile.default;
    })
    (lib.mkIf (fontProfile ? mono) {
      style.font.mono = lib.mkDefault fontProfile.mono;
    })
  ];
}
