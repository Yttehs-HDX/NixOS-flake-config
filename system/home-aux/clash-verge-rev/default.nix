{ lib, profile, ... }:

let
  mkHomeAuxModule = import ../_lib/mkHomeAuxModule.nix;
in
mkHomeAuxModule {
  inherit lib profile;
  name = "clash-verge-rev";
  inner = ./inner.nix;
}
