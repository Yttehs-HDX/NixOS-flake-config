{ config, lib, ... }:

let
  mkHomeAux = import ../_lib/mkHomeAuxModule.nix {
    inherit lib config;
    name = "android-tools";
  };
  inner = import ./inner.nix { inherit config; };
in mkHomeAux inner
