{ lib, config, ... }:

let
  palettes = import ./catppuccin/inner/palettes.nix {};
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
  themeProfile = styleProfile.theme or {};
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
          description = "Derived palette values (computed from desktop.style.theme.flavor).";
        };
      };
    };
    default = {};
    description = "Theme selection and derived values for style modules.";
  };

  config = lib.mkMerge [
    (lib.mkIf (themeProfile ? name) {
      desktop.style.theme.name = lib.mkDefault themeProfile.name;
    })
    (lib.mkIf (themeProfile ? accent) {
      desktop.style.theme.accent = lib.mkDefault themeProfile.accent;
    })
    (lib.mkIf (themeProfile ? flavor) {
      desktop.style.theme.flavor = lib.mkDefault themeProfile.flavor;
    })
    (let
      theme = config.desktop.style.theme;
      flavor = theme.flavor or "mocha";
      accentName = theme.accent or "lavender";
      palette = palettes.${flavor} or palettes.mocha;
      accent = palette.${accentName} or palette.lavender;
    in {
      desktop.style.theme.palette = lib.mkIf (theme.name == "catppuccin")
        (palette // {
          accent = accent;
          accentName = accentName;
        });
    })
  ];
}
