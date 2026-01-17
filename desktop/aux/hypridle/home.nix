{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "hypridle";
  };
  inner = import ./inner-home.nix { };
in mkAux inner
