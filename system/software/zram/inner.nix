{ config, lib, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "zram";
  };
in mkSystemSoftware {

  zramSwap.enable = true;
}
