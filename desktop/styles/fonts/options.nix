{ lib, config, ... }:

let
  profileUsers = config.profile.users or {};
  userName =
    if config ? home && config.home ? username then
      config.home.username
    else if profileUsers == {} then
      null
    else
      builtins.head (builtins.attrNames profileUsers);
  userProfile = if userName == null then {} else (profileUsers.${userName} or {});
  styleProfile = (userProfile.desktop or {}).style or {};
  fontProfile = styleProfile.fonts or {};
  monoProfile = fontProfile.mono or {};
in {
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
          default = {};
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
    default = {};
    description = "Font families for UI and monospace usage.";
  };

  config = lib.mkMerge [
    (lib.mkIf (fontProfile ? default) {
      desktop.style.fonts.default = lib.mkDefault fontProfile.default;
    })
    (lib.mkIf (monoProfile ? default) {
      desktop.style.fonts.mono.default = lib.mkDefault monoProfile.default;
    })
  ];
}
