{ config, lib, pkgs, username, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config username;
    name = "cmatrix";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkSoftware inner
