{ config, lib, pkgs, ... }:

let
  mkSoftware = import ../_lib/mkSoftwarePackage.nix {
    inherit lib config;
    name = "wechat";
  };
in mkSoftware {

  home.packages = [ pkgs.wechat ];
}
