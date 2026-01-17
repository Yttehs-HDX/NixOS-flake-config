{ config, lib, pkgs, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "refind";
  };
in mkSystemSoftware {

  environment.systemPackages = with pkgs; [ refind ];
}
