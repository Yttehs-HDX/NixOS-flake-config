{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "playerctl";
  };
  inner = import ./inner-home.nix { inherit pkgs; };
in mkAux inner
