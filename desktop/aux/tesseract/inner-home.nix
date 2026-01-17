{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "tesseract";
  };
in mkAux { home.packages = [ pkgs.tesseract ]; }
