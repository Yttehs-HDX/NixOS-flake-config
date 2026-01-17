{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "blueman";
  };
in mkAux { services.blueman-applet.enable = true; }
