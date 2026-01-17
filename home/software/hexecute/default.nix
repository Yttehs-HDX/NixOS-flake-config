{ config, lib, pkgs, hexecute, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "hexecute";
  };
  inner = import ./inner.nix { inherit pkgs hexecute; };
in mkSoftware inner
