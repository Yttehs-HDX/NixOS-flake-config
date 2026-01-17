{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "jetbrains-toolbox";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
