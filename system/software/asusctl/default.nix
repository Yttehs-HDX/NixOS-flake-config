{ config, lib, pkgs, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "asusctl";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSystemSoftware inner
