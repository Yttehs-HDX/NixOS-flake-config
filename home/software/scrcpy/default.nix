{ lib, profile, ... }:

let
  mkSoftwarePackage = import ../_lib/mkSoftwarePackage.nix;
in
mkSoftwarePackage {
  inherit lib profile;
  name = "scrcpy";
  inner = ./inner.nix;
}
