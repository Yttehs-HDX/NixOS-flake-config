{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "libnotify";
  };
in mkAux { home.packages = [ pkgs.libnotify ]; }
