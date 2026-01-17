{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "brightnessctl";
  };
  inner = import ./inner-home.nix { inherit pkgs; };
in mkAux inner
