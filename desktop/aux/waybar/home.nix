{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "waybar";
  };
  inner = import ./inner-home { };
in mkAux inner
