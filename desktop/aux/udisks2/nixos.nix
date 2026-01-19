{ config, lib, hostname, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config hostname;
    name = "udisks2";
  };
  inner = import ./inner-nixos.nix { };
in mkAux inner
