{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "udisks2";
  };
in mkAux { services.udiskie.enable = true; }
