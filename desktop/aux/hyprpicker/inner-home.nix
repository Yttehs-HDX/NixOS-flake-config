{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "hyprpicker";
  };
in mkAux { home.packages = [ pkgs.hyprpicker ]; }
