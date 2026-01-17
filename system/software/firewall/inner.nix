{ config, lib, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "firewall";
  };
in mkSystemSoftware {

  networking.firewall.enable = false;
}
