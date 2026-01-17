{ config, lib, pkgs, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "swaylock-effects";
  };
  inner = import ./inner-home.nix { inherit config pkgs; };
in mkAux inner
