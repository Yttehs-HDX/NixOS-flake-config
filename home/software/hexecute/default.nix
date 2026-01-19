{ config, lib, pkgs, hexecute, username, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config username;
    name = "hexecute";
  };
  inner = import ./inner.nix { inherit pkgs hexecute; };
in mkSoftware inner
