{ lib, profile, ... }:

let
  desktop = profile.desktop or {};
  styles = desktop.styles or {};
  qt = styles.qt or {};
  kvantum = qt.kvantum or {};
  enabled = (desktop.enable or false) && (kvantum.enable or false);
in {
  config = lib.mkIf enabled {
    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style.name = "kvantum";
    };
  };
}
