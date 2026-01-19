{ config, lib, username, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config username;
    name = "zsh";
  };
  inner = import ./inner.nix { };
in mkSoftware inner
