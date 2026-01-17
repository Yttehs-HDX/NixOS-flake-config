{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "pipes-rs";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
