{ config, lib, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "grub";
  };
  inner = import ./inner.nix { };
in mkSystemSoftware inner
