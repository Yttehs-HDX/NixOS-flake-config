{ config, lib, username, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config username;
    name = "translate-shell";
  };
  inner = import ./inner.nix { };
in mkSoftware inner
