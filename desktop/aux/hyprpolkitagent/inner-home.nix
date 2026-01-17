{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "hyprpolkitagent";
  };
in mkAux { services.hyprpolkitagent.enable = true; }
