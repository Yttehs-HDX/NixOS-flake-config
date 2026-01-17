{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "clash-verge-rev";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
