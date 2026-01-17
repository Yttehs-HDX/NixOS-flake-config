{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "playerctl";
  };
in mkAux { home.packages = [ pkgs.playerctl ]; }
