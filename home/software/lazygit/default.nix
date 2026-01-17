{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "lazygit";
  };
  inner = import ./inner.nix { };
in mkSoftware inner
