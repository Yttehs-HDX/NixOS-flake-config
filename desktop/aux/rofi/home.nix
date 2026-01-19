{ config, lib, username, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config username;
    name = "rofi";
  };
  inner = import ./inner-home.nix { };
in mkAux inner
