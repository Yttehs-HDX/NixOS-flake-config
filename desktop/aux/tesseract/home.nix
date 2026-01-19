{ config, lib, pkgs, username, ... }:

let
  mkAux = import ../_lib/mkAuxPackage.nix {
    inherit lib config username;
    name = "tesseract";
  };
  inner = import ./inner-home.nix { inherit pkgs; };
in mkAux inner
