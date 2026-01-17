{ config, lib, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "bluetooth";
  };
in mkSystemSoftware {

  hardware.bluetooth.enable = true;
}
