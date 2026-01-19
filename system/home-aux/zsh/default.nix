{ config, lib, pkgs, hostname, ... }:

let
  mkHomeAux = import ../_lib/mkHomeAuxModule.nix {
    inherit lib config hostname;
    name = "zsh";
  };
  inner = import ./inner.nix { inherit pkgs; };
in mkHomeAux inner
