{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "universal-android-debloater";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
