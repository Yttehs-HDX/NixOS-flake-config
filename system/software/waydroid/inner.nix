{ config, lib, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "waydroid";
  };
in mkSystemSoftware {

  virtualisation.waydroid.enable = true;
}
