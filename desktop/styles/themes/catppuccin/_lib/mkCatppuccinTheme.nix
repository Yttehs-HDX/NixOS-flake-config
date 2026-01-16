{ lib, config }:

let
  desktop = config.desktop or { };
  style = desktop.style or { };
  theme = style.theme or { };
  themeName = theme.name or "";
  flavor = theme.flavor or "mocha";
  accent = theme.accent or "lavender";
  catppuccin = "catppuccin-${flavor}-${accent}";
in mkConfig:
lib.mkIf (themeName == "catppuccin")
(mkConfig { inherit style theme themeName flavor accent catppuccin; })
