{ config, lib, ... }:

let
  mkHomeAux = import ../_lib/mkHomeAuxModule.nix {
    inherit lib config;
    name = "neovim";
  };
  inner = import ./inner.nix { };
in mkHomeAux inner
