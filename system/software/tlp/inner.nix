{ config, lib, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "tlp";
  };
in mkSystemSoftware {

  services.tlp.enable = true;
}
