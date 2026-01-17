{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "pipewire";
  };
  inner = import ./inner-nixos.nix { };
in mkAux inner
