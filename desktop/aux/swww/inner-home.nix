{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "swww";
  };
in mkAux { services.swww.enable = true; }
