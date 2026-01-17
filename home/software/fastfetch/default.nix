{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "fastfetch";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
