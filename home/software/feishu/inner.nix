{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "feishu";
  };
in mkSoftware {

  home.packages = [ pkgs.feishu ];
}
