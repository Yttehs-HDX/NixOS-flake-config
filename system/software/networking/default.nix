{ config, lib, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "networking";
  };
  inner = import ./inner.nix { inherit config; };
in mkSystemSoftware inner
