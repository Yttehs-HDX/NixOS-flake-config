{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "tgpt";
  };
in mkSoftware {

  home.packages = [ pkgs.tgpt ];
}
