{ lib, profile, ... }:

let
  mkAuxPackage = import ../_lib/mkAuxPackage.nix;

in
mkAuxPackage {
  inherit lib profile;
  name = "noto-fonts-emoji-blob-bin";
  inner = ./inner-home.nix;
}
