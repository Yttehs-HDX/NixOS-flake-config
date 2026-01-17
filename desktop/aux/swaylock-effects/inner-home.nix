{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "swaylock-effects";
  };
in mkAux { home.packages = [ pkgs.swaylock-effects ]; }
