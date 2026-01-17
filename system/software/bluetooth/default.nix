{ config, lib, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "bluetooth";
  };
  inner = import ./inner.nix { };
in mkSystemSoftware inner
