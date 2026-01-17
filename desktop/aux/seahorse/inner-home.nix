{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "seahorse";
  };
in mkAux { home.packages = [ pkgs.seahorse ]; }
