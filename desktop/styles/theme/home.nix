{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  enabled = desktop.enable or false;

in {
  config = lib.mkIf enabled {
    userTheme = {
      catppuccinVariant = "mocha";
      catppuccinAccent = "lavender";
      fontFamily = "SF Pro";
      fontSize = 12;
      cursorSize = 24;
    };
  };
}
