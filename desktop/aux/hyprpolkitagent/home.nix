{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "hyprpolkitagent";
  };
  inner = import ./inner-home.nix { };
in mkAux inner
