{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "unrar";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
