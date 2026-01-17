{ config, lib, pkgs, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "refind";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSystemSoftware inner
