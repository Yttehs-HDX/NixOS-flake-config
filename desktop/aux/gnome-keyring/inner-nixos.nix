{ config, lib, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config;
    name = "gnome-keyring";
  };
in mkAux { services.gnome.gnome-keyring.enable = true; }
