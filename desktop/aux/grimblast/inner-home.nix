{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "grimblast";
  };
in mkAux { home.packages = [ pkgs.grimblast ]; }
