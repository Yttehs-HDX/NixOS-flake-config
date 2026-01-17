{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "unzip";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
