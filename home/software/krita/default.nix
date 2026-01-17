{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "krita";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
