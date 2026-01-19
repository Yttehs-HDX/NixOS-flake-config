{ config, lib, hostname, ... }:

let
  mkHomeAux = import ../_lib/mkHomeAuxModule.nix {
    inherit lib config hostname;
    name = "android-tools";
  };
  inner =
    integrated: import ./inner.nix { inherit (integrated) usernames; };
in mkHomeAux inner
