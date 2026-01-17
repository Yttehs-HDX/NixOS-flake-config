{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "vlc";
  };
in mkAux { home.packages = [ pkgs.vlc ]; }
