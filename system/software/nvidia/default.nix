{ config, lib, pkgs, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "nvidia";
  };
  inner = import ./inner.nix { inherit lib pkgs; };
in mkSystemSoftware inner
