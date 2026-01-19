{ config, lib, hostname, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config hostname;
    name = "gnome-keyring";
  };
  inner = import ./inner-nixos.nix { };
in mkAux inner
