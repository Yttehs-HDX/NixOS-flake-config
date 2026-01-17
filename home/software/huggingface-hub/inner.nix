{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "huggingface-hub";
  };
in mkSoftware {

  home.packages = [ pkgs.python313Packages."huggingface-hub" ];
}
