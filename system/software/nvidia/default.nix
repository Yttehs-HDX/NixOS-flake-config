{ config, lib, pkgs, hostname, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config hostname;
    name = "nvidia";
  };
  inner = import ./inner.nix { inherit lib pkgs; };
in mkSystemSoftware inner
