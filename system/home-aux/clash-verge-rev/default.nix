{ config, lib, ... }:

let
  mkHomeAux = import ../_lib/mkHomeAuxModule.nix {
    inherit lib config;
    name = "clash-verge-rev";
  };
  inner = import ./inner.nix { };
in mkHomeAux inner
