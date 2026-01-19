{ config, lib, hostname, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config hostname;
    name = "blueman";
  };
  inner = import ./inner-nixos.nix { };
in mkAux inner
