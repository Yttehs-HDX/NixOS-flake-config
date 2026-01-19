{ config, lib, username, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config username;
    name = "blueman";
  };
  inner = import ./inner-home.nix { };
in mkAux inner
