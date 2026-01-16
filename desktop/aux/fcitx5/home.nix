{ lib, profile, ... }:

let mkAuxPackage = import ../_lib/mkAuxPackage.nix;
in mkAuxPackage {
  inherit lib profile;
  name = "fcitx5";
  inner = ./inner-home.nix;
}
