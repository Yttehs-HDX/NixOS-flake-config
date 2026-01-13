{ lib, profile, ... }:

let
  mkAuxPackage = import ../_lib/mkAuxPackage.nix;

in
mkAuxPackage {
  inherit lib profile;
  name = "noto-fonts-cjk-sans";
  inner = ./inner-home.nix;
}
