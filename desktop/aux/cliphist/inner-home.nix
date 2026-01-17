{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "cliphist";
  };
in mkAux { services.cliphist.enable = true; }
