{ config, lib, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "firewall";
  };
  inner = import ./inner.nix { };
in mkSystemSoftware inner
