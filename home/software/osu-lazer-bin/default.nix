{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "osu-lazer-bin";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
