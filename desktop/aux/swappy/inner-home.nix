{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "swappy";
  };
in mkAux { home.packages = [ pkgs.swappy ]; }
