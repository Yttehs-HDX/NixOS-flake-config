{ lib, profile, ... }:

let
  mkAuxPackage = import ../_lib/mkAuxPackage.nix;
in
mkAuxPackage {
  inherit lib profile;
  name = "rofi";
  inner = ./inner.nix;
}
