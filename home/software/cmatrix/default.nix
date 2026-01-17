{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "cmatrix";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
