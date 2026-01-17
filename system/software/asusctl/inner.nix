{ config, lib, pkgs, ... }:

let
  mkSystemSoftware = import ../_lib/mkSystemSoftwareModule.nix {
    inherit lib config;
    name = "asusctl";
  };
in mkSystemSoftware {

  environment.systemPackages = with pkgs; [ asusctl ];

  services.asusd.enable = true;
}
