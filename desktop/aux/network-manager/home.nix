{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "network-manager";
  };
  inner = import ./inner-home.nix { };
in mkAux inner
