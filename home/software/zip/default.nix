{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "zip";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
