{ lib, config, profile, ... }:

let
  palettes = import ./palettes.nix {};
  styleProfile = (profile.desktop or {}).style or {};
  themeProfile = styleProfile.theme or {};
in {
  imports = [
    ./default-value.nix
  ];

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
