{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "rofimoji";
  };
in mkAux { home.packages = [ pkgs.rofimoji ]; }
