{ lib, ... }:

let
  mkSoftwarePackage = import ../_lib/mkSoftwarePackage.nix { inherit lib; };
in
mkSoftwarePackage {
  name = "android-tools";
  inner = ./inner.nix;
}
