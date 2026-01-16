{ lib, profile, nixvim, ... }:

let
  mkSoftwarePackage = import ../_lib/mkSoftwarePackage.nix;
in
{
  imports = [
    nixvim.homeModules.nixvim
    (mkSoftwarePackage {
      inherit lib profile;
      name = "neovim";
      inner = ./inner.nix;
    })
  ];
}
