{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "udisks2";
  };
  inner = import ./inner-nixos.nix { };
in mkAux inner
