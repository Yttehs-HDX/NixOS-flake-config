{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "pulseaudio";
  };
in mkAux { home.packages = [ pkgs.pulseaudio ]; }
