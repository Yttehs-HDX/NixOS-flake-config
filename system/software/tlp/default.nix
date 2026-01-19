{ config, lib, hostname, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config hostname;
    name = "tlp";
  };
  inner = import ./inner.nix { };
in mkSystemSoftware inner
