{ lib, ... }:

let
  mkSoftwarePackage = import ../_lib/mkSoftwarePackage.nix { inherit lib; };
in
mkSoftwarePackage {
  name = "tgpt";
  inner = ./inner.nix;
}
