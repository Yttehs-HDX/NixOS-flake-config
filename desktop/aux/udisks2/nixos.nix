{ lib, profile, ... }:

let mkAuxPackage = import ../_lib/mkAuxPackage.nix;
in mkAuxPackage {
  inherit lib profile;
  name = "udisks2";
  inner = ./inner-nixos.nix;
}
