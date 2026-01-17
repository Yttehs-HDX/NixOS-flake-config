{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "nixfmt-classic";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
