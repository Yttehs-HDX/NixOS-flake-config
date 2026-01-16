{ lib, profile, pkgs, ... }:

let mkSoftwarePackage = import ../_lib/mkSoftwarePackage.nix;
in mkSoftwarePackage {
  inherit lib profile;
  name = "android-tools";
  inner = ./inner.nix;
}
