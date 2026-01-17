{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "network-manager";
  };
in mkAux { services.network-manager-applet.enable = true; }
