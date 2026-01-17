{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "brightnessctl";
  };
in mkAux { home.packages = [ pkgs.brightnessctl ]; }
