{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "udisks2";
  };
in mkAux { services.udisks2.enable = true; }
