{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "cbonsai";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
