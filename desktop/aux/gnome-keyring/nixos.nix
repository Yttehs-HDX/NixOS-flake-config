{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "gnome-keyring";
  };
  inner = import ./inner-nixos.nix { };
in mkAux inner
