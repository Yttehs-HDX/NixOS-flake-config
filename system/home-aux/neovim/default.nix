{ config, lib, hostname, ... }:

let
  mkHomeAux = import ../_lib/mkHomeAuxModule.nix {
    inherit lib config hostname;
    name = "neovim";
  };
  inner = import ./inner.nix { };
in mkHomeAux inner
