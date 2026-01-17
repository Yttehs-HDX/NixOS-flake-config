{ config, lib, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "tmux";
  };
  inner = import ./inner.nix { };
in mkSoftware inner
