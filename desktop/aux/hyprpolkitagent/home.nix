{ config, lib, username, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config username;
    name = "hyprpolkitagent";
  };
  inner = import ./inner-home.nix { };
in mkAux inner
