{ lib, nixvim, ... }:

let
  mkSoftwarePackage = import ../_lib/mkSoftwarePackage.nix { inherit lib; };
in
{
  imports = [
    nixvim.homeModules.nixvim
    (mkSoftwarePackage {
      name = "nixvim";
      inner = ./inner.nix;
    })
  ];
}
