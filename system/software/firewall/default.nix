{ config, lib, hostname, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config hostname;
    name = "firewall";
  };
  inner = import ./inner.nix { };
in mkSystemSoftware inner
