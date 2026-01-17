{ config, lib, pkgs, ... }:

let
  mkHomeAux = import ../_lib/mkHomeAuxModule.nix {
    inherit lib config;
    name = "zsh";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkHomeAux inner
