{ config, lib, username, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config username;
    name = "waybar";
  };
  inner = import ./inner-home { };
in mkAux inner
