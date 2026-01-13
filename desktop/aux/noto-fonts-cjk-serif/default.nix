{ lib, profile, ... }:

let
  mkAuxPackage = import ../_lib/mkAuxPackage.nix;

in
mkAuxPackage {
  inherit lib profile;
  name = "noto-fonts-cjk-serif";
  inner = ./inner-home.nix;
}
