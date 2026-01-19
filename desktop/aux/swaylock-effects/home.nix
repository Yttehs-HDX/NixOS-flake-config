{ config, lib, pkgs, username, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config username;
    name = "swaylock-effects";
  };
  inner = import ./inner-home.nix { inherit config pkgs; };
in mkAux inner
